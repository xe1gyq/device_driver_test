#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <linux/videodev2.h>
#include <string.h>
#include <signal.h>
#include <sys/resource.h>

#define VIDIOC_S_OMAP2_ROTATION		_IOW('V', 3, int)
#define FBDEVICE "/dev/fb0"
#define VIDEO_DEVICE1 "/dev/video1"
#define VIDEO_DEVICE2 "/dev/video2"

#define DEFAULT_PIXEL_FMT "YUYV"
#define DEFAULT_VIDEO_SIZE "QCIF"

struct child_args {
	int priority;
	int value;
	int fd;
};

static void usage(void)
{
	printf("process_cam [child priority 1]"
					" [child priority 2]\n");
	printf("   To start streaming capture of 1000 frames\n");
	/*printf("   [camDevice] Camera device to be open\n\t 1:Micron sensor "
					"2:OV sensor\n");*/
	printf("   [child priority 1] is the priority of the first child "
			" process created with the lower brigthness value\n"
			"\tDefault priority = 20\n");
	printf("   [child priority 2] is the priority of the second child "
			" process created with the higher brigthness value\n"
			"\tDefault priority = -10\n");
	printf("   Default pixel format = YUYV\n");
	printf("   Default size = QCIF\n");
}

void set_control(void *t_args)
{
	int which = PRIO_PROCESS;
	int ret;
	int retn;
	struct v4l2_control control_config;
	struct child_args *args = (struct child_args *)t_args;
	int i;
	id_t pid;

	pid = getpid();
	retn = setpriority(which, pid, args->priority);

	args->fd = open_cam_device(O_RDWR, 1);

	if (args->fd <= 0)
		printf("Could not open the cam device inside the process\n");

	control_config.id = V4L2_CID_BRIGHTNESS;
	control_config.value = args->value;
	/* set h3a params */
	printf("Setting brigtness from child with priority=%d ;"
		" control value=%d\n", args->priority, args->value);
	while (1) {
		ret = ioctl(args->fd, VIDIOC_S_CTRL, &control_config);
		if (ret < 0)
			printf("VIDIOC_S_CTRL Error: %d, ", ret);
	}

	close(args->fd);
	printf("File descriptor for priority %d closed\n", args->priority);

}

int main(int argc, char *argv[])
{
	struct child_args t_args1, t_args2;
	int child1_pid, child2_pid;
	void *child1_stack;
	void *child2_stack;
	struct screen_info_struct {
		int fd;
		char *data;
		int width;
		int height;
		struct fb_fix_screeninfo fbfix;
		struct fb_var_screeninfo info;
	} screen_info ;
	struct {
		void *start;
		size_t length;
	} *vbuffers, *cbuffers;
	void *src_start;
	struct v4l2_capability capability;
	struct v4l2_format cformat, vformat;
	struct v4l2_requestbuffers creqbuf, vreqbuf;
	struct v4l2_buffer cfilledbuffer, vfilledbuffer;
	int fd, i, ret, count = -1, memtype = V4L2_MEMORY_MMAP;
	int fd_save = 0;
	int index = 1, vid = 1, set_video_img = 0;
	int degree;
	int device = 1;
	int framerate = 30;

	if ((argc > 1) && (!strcmp(argv[1], "?"))) {
		usage();
		return 0;
	}

	printf("Allocating space for the child stack 1\n");
	child1_stack = (void *)malloc(4096);
	if (!child1_stack) {
		printf("ERROR: cannot create stack for child");
		exit(1);
	}
	/* printf("Direccion de memoria de child1_stack=%x\n", child1_stack); */

	printf("Allocating space for the child stack 2\n");
	child2_stack = (void *)malloc(4096);
	if (!child2_stack) {
		printf("ERROR: cannot create stack for child");
		exit(1);
	}
	/* printf("Direccion de memoria de child2_stack=%x\n", child2_stack); */

	t_args1.priority = 20;
	t_args1.value = 0;

	t_args2.priority = -10;
	t_args2.value = 8;

	/*if (argc > index) {
		device = atoi(argv[index]);
		index++;
	}*/

	if (argc > index) {
		t_args1.priority = atoi(argv[index]);
		index++;
	}

	if (argc > index) {
		t_args2.priority = atoi(argv[index]);
		index++;
	}

	fd = open_cam_device(O_RDWR, device);
	if (fd <= 0) {
		printf("Could not open the cam device\n");
		return -1;
	}

	printf("Setting pixel format and video size with default "
					"values\n");
	ret = cam_ioctl(fd, DEFAULT_PIXEL_FMT, DEFAULT_VIDEO_SIZE);
	if (ret < 0)
		return -1;
	ret = setFramerate(fd, framerate);
	if (ret < 0) {
		printf("Error setting framerate = %d\n", framerate);
		return -1;
	}

	count = 400;
	printf("Frames: %d\n", count);
	index++;
	if (count >= 1000 || count <= 0)
		count = -1;

	if (vid != 0) {
		screen_info.fd = open((vid == 1) ? VIDEO_DEVICE1 :
					VIDEO_DEVICE2, O_RDWR);
		if (screen_info.fd <= 0) {
			printf("Could no open the device %s\n",
				(vid == 1) ? VIDEO_DEVICE1 : VIDEO_DEVICE2);
			vid = 0;
		} else {
			printf("openned %s for rendering\n",
				(vid == 1) ? VIDEO_DEVICE1 : VIDEO_DEVICE2);
		}

	}
	if (vid == 0) {
		screen_info.fd = open(FBDEVICE, O_RDWR);
		if (screen_info.fd <= 0) {
			printf("Could not open the device " FBDEVICE "\n");
			return -1;
		}
	}

	if (vid != 0) {
		if (ioctl(screen_info.fd, VIDIOC_QUERYCAP, &capability) == -1) {
			perror("video VIDIOC_QUERYCAP");
			return -1;
		}
		if (capability.capabilities & V4L2_CAP_STREAMING)
			printf("The video driver is capable of Streaming!\n");
		else {
			printf("The video driver is not capable of "
						"Streaming!\n");
			return -1;
		}
	} else {
		ret = ioctl(screen_info.fd, FBIOGET_FSCREENINFO,
							&screen_info.fbfix);
		if (ret != 0) {
			perror("FBIOGET_FSCREENINFO");
			return -1;
		}
	}

	ioctl(screen_info.fd, FBIOGET_VSCREENINFO, &screen_info.info) ;
	screen_info.width = screen_info.info.xres ;
	screen_info.height = screen_info.info.yres ;
	printf("physical address of frame buffer : %x\n",
					screen_info.fbfix.smem_start);
	printf("Screen Width = %d, Height = %d\n", screen_info.width,
					screen_info.height);

	screen_info.data = (unsigned char *)mmap(0,
					screen_info.width*screen_info.height*2,
					(PROT_READ|PROT_WRITE),
					MAP_SHARED, screen_info.fd, 0);

	if (ioctl(fd, VIDIOC_QUERYCAP, &capability) < 0) {
		perror("VIDIOC_QUERYCAP");
		return -1;
	}
	if (capability.capabilities & V4L2_CAP_STREAMING)
		printf("The driver is capable of Streaming!\n");
	else {
		printf("The driver is not capable of Streaming!\n");
		return -1;
	}

	cformat.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	ret = ioctl(fd, VIDIOC_G_FMT, &cformat);
	if (ret < 0) {
		perror("VIDIOC_G_FMT");
		return -1;
	}
	printf("Camera Image width = %d, Image height = %d, size = %d\n",
		cformat.fmt.pix.width,
		cformat.fmt.pix.height,
		cformat.fmt.pix.sizeimage);

	if (vid != 0) {
		vformat.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
		ret = ioctl(screen_info.fd, VIDIOC_G_FMT, &vformat);
		if (ret < 0) {
			perror("video VIDIOC_G_FMT");
			return -1;
		}
		printf("Video Image width = %d, Image height = %d, size = %d\n",
			vformat.fmt.pix.width,
			vformat.fmt.pix.height,
			vformat.fmt.pix.sizeimage);

		if ((cformat.fmt.pix.width != vformat.fmt.pix.width) ||
		    (cformat.fmt.pix.height != vformat.fmt.pix.height)) {
			printf("image sizes don't match!\n");
			set_video_img = 1;
		}
		if (cformat.fmt.pix.pixelformat !=
		    vformat.fmt.pix.pixelformat) {
			printf("pixel formats don't match!\n");
			set_video_img = 1;
		}

		degree = 0;
		ret = ioctl(screen_info.fd, VIDIOC_S_OMAP2_ROTATION, &degree);
		if (ret < 0) {
			perror("VIDIOC_S_OMAP2_ROTATION");
			return 0;
		}
		printf("Rotation set to %d degree\n", degree);

		if (set_video_img) {
			printf("set video image the same as camera image ..\n");
			vformat.fmt.pix.width = cformat.fmt.pix.width;
			vformat.fmt.pix.height = cformat.fmt.pix.height;
			vformat.fmt.pix.sizeimage = cformat.fmt.pix.sizeimage;
			vformat.fmt.pix.pixelformat =
			cformat.fmt.pix.pixelformat;
			ret = ioctl(screen_info.fd, VIDIOC_S_FMT, &vformat);
			if (ret < 0) {
				perror("video VIDIOC_S_FMT");
				return -1;
			}
			printf("New Image & Video sizes, after "
					"equaling:\nCamera Image width = %d, "
					"Image height = %d, size = %d\n",
					cformat.fmt.pix.width,
					cformat.fmt.pix.height,
					cformat.fmt.pix.sizeimage);
			printf("Video Image width = %d, Image height "
					"= %d, size = %d\n",
					vformat.fmt.pix.width,
					vformat.fmt.pix.height,
					vformat.fmt.pix.sizeimage);

			if ((cformat.fmt.pix.width != vformat.fmt.pix.width) ||
			    (cformat.fmt.pix.height !=
			     vformat.fmt.pix.height) ||
			    (cformat.fmt.pix.pixelformat !=
			     vformat.fmt.pix.pixelformat)) {
				printf("can't make camera and video image "
					"compatible!\n");
				return 0;
			}
		}

		vreqbuf.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
		vreqbuf.memory = V4L2_MEMORY_MMAP;
		vreqbuf.count = 4;
		if (ioctl(screen_info.fd, VIDIOC_REQBUFS, &vreqbuf) == -1) {
			perror("video VIDEO_REQBUFS");
			return;
		}
		printf("Video Driver allocated %d buffers when 4 are "
				"requested\n", vreqbuf.count);

		vbuffers = calloc(vreqbuf.count, sizeof(*vbuffers));
		for (i = 0; i < vreqbuf.count; ++i) {
			struct v4l2_buffer buffer;
			buffer.type = vreqbuf.type;
			buffer.index = i;
			if (ioctl(screen_info.fd, VIDIOC_QUERYBUF,
							&buffer) == -1) {
				perror("video VIDIOC_QUERYBUF");
				return;
			}
			vbuffers[i].length = buffer.length;
			vbuffers[i].start = mmap(NULL, buffer.length,
						PROT_READ | PROT_WRITE,
						MAP_SHARED,
						screen_info.fd,
						buffer.m.offset);
			if (vbuffers[i].start == MAP_FAILED) {
				perror("video mmap");
				return;
			}
			printf("Video Buffers[%d].start = %x  length = %d\n",
				i, vbuffers[i].start, vbuffers[i].length);

		}
	}

	creqbuf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	creqbuf.memory = memtype;
	creqbuf.count = 4;
	printf("Requesting %d buffers of type %s\n", creqbuf.count,
		(memtype == V4L2_MEMORY_USERPTR) ? "V4L2_MEMORY_USERPTR" :
						"V4L2_MEMORY_MMAP");
	if (ioctl(fd, VIDIOC_REQBUFS, &creqbuf) < 0) {
		perror("VIDEO_REQBUFS");
		return -1;
	}
	printf("Camera Driver allowed buffers reqbuf.count = %d\n",
						creqbuf.count);


	cbuffers = calloc(creqbuf.count, sizeof(*cbuffers));
	/* mmap driver memory or allocate user memory, and queue each buffer */
	for (i = 0; i < creqbuf.count; ++i) {
		struct v4l2_buffer buffer;
		buffer.type = creqbuf.type;
		buffer.memory = creqbuf.memory;
		buffer.index = i;
		if (ioctl(fd, VIDIOC_QUERYBUF, &buffer) < 0) {
			perror("VIDIOC_QUERYBUF");
			return -1;
		}
		if (memtype == V4L2_MEMORY_USERPTR) {
			if (vid == 0) {
				cbuffers[i].length = cformat.fmt.pix.sizeimage;
				/* round to 4KB page */
				if (cbuffers[i].length & 0xfff) {
					cbuffers[i].length =
						(cbuffers[i].length &
						0xfffff000)
						+ 0x1000;
				}
				cbuffers[i].start = malloc(cbuffers[i].length);
				printf("User Buffers[%d].start = %x  length ="
					" %d\n", i, cbuffers[i].start,
					cbuffers[i].length);
			}
			buffer.flags = 0;
			buffer.m.userptr = (unsigned int)vbuffers[i].start;
			buffer.length = vbuffers[i].length;
		} else {
			cbuffers[i].length = buffer.length;
			cbuffers[i].start = mmap(NULL, buffer.length,
						PROT_READ | PROT_WRITE,
						MAP_SHARED,
						fd,
						buffer.m.offset);
			if (cbuffers[i].start == MAP_FAILED) {
				perror("mmap");
				return -1;
			}
			printf("Mapped Buffers[%d].start = %x  length = %d\n",
				i, cbuffers[i].start, cbuffers[i].length);

			buffer.m.userptr = (unsigned int)cbuffers[i].start;
			buffer.length = cbuffers[i].length;
		}

		if (ioctl(fd, VIDIOC_QBUF, &buffer) < 0) {
			perror("CAMERA VIDIOC_QBUF");
			return -1;
		}
	}

	/* turn on streaming */
	if (ioctl(fd, VIDIOC_STREAMON, &creqbuf.type) < 0) {
		perror("VIDIOC_STREAMON");
		return -1;
	}
	if (vid != 0) {
		if (ioctl(screen_info.fd, VIDIOC_STREAMON, &vreqbuf.type) < 0) {
			perror("video VIDIOC_STREAMON");
			return -1;
		}
	}

	/* caputure 1000 frames or when we hit the passed nmuber of frames */
	cfilledbuffer.type = creqbuf.type;
	vfilledbuffer.type = vreqbuf.type;
	i = 0;
	vfilledbuffer.index = -1;

	/* get priority of current process */
	id_t pid;
	int retn;
	pid = getpid();
	retn = getpriority(PRIO_PROCESS, pid);

	printf("Priority of parent process: %d\n", retn);
	while (i < 1000) {
		/*Creating threads to execute the same function*/
		if (i == 100) {
			printf("Invoking clone for child1\n");
			child1_pid = fork();
			/*child1_pid = clone((void *)&set_control, child1_stack,
				SIGCHLD | CLONE_FS | CLONE_FILES |
				CLONE_SIGHAND | CLONE_VM, (void *)&t_args1);*/
			if (child1_pid == 0) {
				set_control((void *)&t_args1);
			} else if (child1_pid == -1) {
				printf("error en funcion clone");
				exit(2);
			}
		}
		if (i == 200) {
			printf("Invoking clone for child2\n");
			child2_pid = fork();
			/*child2_pid = clone((void *)&set_control, child2_stack,
				SIGCHLD | CLONE_FS | CLONE_FILES |
				CLONE_SIGHAND | CLONE_VM, (void *)&t_args2);*/
			if (child2_pid == 0)
				set_control((void *)&t_args2);
			else if (child2_pid == -1) {
				printf("error en funcion clone");
				exit(2);
			}
		}
		if (i == 300) {
			kill(child2_pid, SIGKILL);
			printf("Child process 2 killed\n");
		}
		/* De-queue the next avaliable buffer */
		while (ioctl(fd, VIDIOC_DQBUF, &cfilledbuffer) < 0) {
			perror("VIDIOC_DQBUF");
			if (vid != 0) {
				while (ioctl(screen_info.fd, VIDIOC_QBUF,
							&vfilledbuffer) < 0) {
					perror("VIDIOC_QBUF***");
				}
			} else {
				while (ioctl(fd, VIDIOC_QBUF,
							&cfilledbuffer) < 0) {
					perror("VIDIOC_QBUF***");
				}

			}
		}
		i++;

	if (memtype == V4L2_MEMORY_MMAP) {
		memcpy(vbuffers[cfilledbuffer.index].start,
		cbuffers[cfilledbuffer.index].start,
		cfilledbuffer.length);
	}

		src_start = cbuffers[cfilledbuffer.index].start;

		if (fd_save > 0) {
			/* this compile option allow us to write video to a
			 * file
			 */
			if (i <= count) {
				/* we only save some frames */
				write(fd_save, src_start,
					cformat.fmt.pix.width *
					cformat.fmt.pix.height * 2);
				printf("written %d frame, fd=%d\n", i, fd_save);
			}
		} else {
			if (vid == 0) {
				/* Display it to the screen */
				rotate_image(src_start, cformat.fmt.pix.width,
						cformat.fmt.pix.height,
					screen_info.data, screen_info.width,
						screen_info.height);
			} else {
				if (vfilledbuffer.index != -1) {
					/* De-queue the previous buffer from
					 * video driver
					 */
					if (ioctl(screen_info.fd, VIDIOC_DQBUF,
						&vfilledbuffer) < 0) {
						perror("cam VIDIOC_DQBUF");
						return;
					}
				}

				vfilledbuffer.index = cfilledbuffer.index;
				/* Queue the new buffer to video driver for
				 * rendering
				 */
				if (ioctl(screen_info.fd, VIDIOC_QBUF,
						&vfilledbuffer) == -1) {
					perror("video VIDIOC_QBUF");
					return;
				}
			}
		}

		if (i == count) {
			printf("Cancelling the streaming capture...\n");
			/* sleep(1); */
			creqbuf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
			if (ioctl(fd, VIDIOC_STREAMOFF, &creqbuf.type) < 0) {
				perror("VIDIOC_STREAMOFF");
				return -1;
			}
			if (vid != 0) {
				if (ioctl(screen_info.fd, VIDIOC_STREAMOFF,
						&vreqbuf.type) == -1) {
					perror("video VIDIOC_STREAMOFF");
					return -1;
				}

			}
			printf("Done\n");
			break;
		}

		while (ioctl(fd, VIDIOC_QBUF, &cfilledbuffer) < 0)
			perror("CAM VIDIOC_QBUF");
	}

	/* Killing child process*/
	kill(child1_pid, SIGKILL);
	printf("Child process 1 killed\n");
	printf("Captured %d frames!\n", i);

	/* we didn't trun off streaming yet */
	if (count == -1) {
		creqbuf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		if (ioctl(fd, VIDIOC_STREAMOFF, &creqbuf.type) == -1) {
			perror("VIDIOC_STREAMOFF");
			return -1;
		}
		if (vid != 0) {
			if (ioctl(screen_info.fd, VIDIOC_STREAMOFF,
						&vreqbuf.type) == -1) {
				perror("video VIDIOC_STREAMOFF");
				return -1;
			}

		}
	}
exit:
	for (i = 0; i < vreqbuf.count; i++) {
		if (vbuffers[i].start)
			munmap(vbuffers[i].start, vbuffers[i].length);
	}

	free(vbuffers);

	for (i = 0; i < creqbuf.count; i++) {
		if (cbuffers[i].start) {
			if (memtype == V4L2_MEMORY_USERPTR)
				free(cbuffers[i].start);
			else
				munmap(cbuffers[i].start, cbuffers[i].length);
		}
	}

	free(cbuffers);
	printf("Freed cbuffers\n");
	/*
	printf("Direccion de memoria de cbuffers=%x", cbuffers);
	printf("Direccion de memoria de child1_stack=%x", child1_stack);
	printf("Direccion de memoria de child2_stack=%x", child2_stack);
	free(child1_stack);
	printf("Freed child1_stack\n");
	free(child2_stack);
	printf("Freed child2_stack\n");
	*/

	munmap(screen_info.data, screen_info.width * screen_info.height * 2);
	close(screen_info.fd);

	ret = setFramerate(fd, 30);
	if (ret < 0) {
		printf("Error setting framerate = %d\n", framerate);
		return -1;
	}

	close(fd);
	if (fd_save > 0)
		close(fd_save);

	return 0;
}
