#===============================================================================
#             Texas Instruments OMAP(TM) Platform Software
#  (c) Copyright Texas Instruments, Incorporated.  All Rights Reserved.
#
#  Use of this software is controlled by the terms and conditions found 
#  in the license agreement under which this software has been supplied.
#===============================================================================

CC := $(CROSS_COMPILE)gcc

ifeq ($(SUITE_DIR),)
SUITE_DIR:=$(PWD)
endif

MODULES = dma_single_channel.o \
  dma_priority_high.o \
  dma_priority_low.o \
  dma_stop_transfer.o \
  dma_addrmode_constant.o \
  dma_addrmode_postinc.o \
  dma_addrmode_singleidx.o \
  dma_addrmode_doubleidx.o \
  dma_burst_disabled.o \
  dma_burst_mode4.o \
  dma_burst_mode8.o \
  dma_burst_mode16.o \
  dma_static_self_link.o \
  dma_unlink_nonlinked_channels.o  \
  dma_unlink_before_stop_channels.o \
  dma_stop_transfer_invalid.o \
  dma_stop_transfer_twice.o \
  dma_thread_access.o

 ifeq ($(TARGET_PLATFORM), $(filter $(TARGET_PLATFORM), OMAP2PLUS OMAP_4430))
 MODULES +=  dma_chain_transfer.o \
  dma_chain_static.o \
  dma_chain_dynamic.o \
  dma_chain_dynamic_removed.o \
  dma_chain_static_removed.o \
  dma_chain_static_invalid.o \
  dma_chain_dynamic_invalid.o \
  dma_chain_dynamic_break.o \
  dma_chain_static_break.o \
  dma_chain_thread_access.o \
  dma_chain_thread_stress.o
 endif

 ifeq ($(TARGET_FILESYSTEM), ANDROID)
 MODULES += dma_dload.o \
  	    dma_addrmode_constant_oswr.o \
	    dma_dload_thread_access.o \
            dma_oswr_trigger.o \
            dma_register_dump.o
 endif

obj-m:=$(MODULES)

all: $(TARGETS)
	make -C $(KDIR) SUBDIRS=$(SUITE_DIR)/utils/dma KERN=26 modules

install:
	cp -v $(MODULES:.o=.ko) $(SUITE_DIR)/modules

$(TARGETS):
	$(CC) $@.c -o $@

clean:
	rm -vrf *.ko *.o *.mod.* *Module* .tmp_versions .dma* modules.order
	rm -vf $(TARGETS)
