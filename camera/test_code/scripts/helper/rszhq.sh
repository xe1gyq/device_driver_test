#!/bin/sh
TESTYPE=$1

# Usage:reszhq ?
#
#downscale downscale 8Mpx "3280 2464"
if [ $TESTYPE = "8MPto8MP" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPto8MP_3280x2464_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "8MPto5MP" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPto5MP_2592x1944_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "8MPtoQXGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoQXGA_2048x1536_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "8MPtoUXGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoUXGA_1600x1200_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "8MPtoSXGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoSXGA_1280x960_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "8MPtoXGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoXGA_1024x768_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "8MPtoSVGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoSVGA_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "8MPtoVGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoVGA_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "8MPtoQVGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoQVGA_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "8MPtoQCIF" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoQCIF_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "8MPtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoQQVGA_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "8MPtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoSQCIF_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "8MPtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/8MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_8MPtoQQCIF_816x618_UYVY.yuv"
  INSIZE="-iw 3280 -ih 2464"
  OUTSIZE="-ow 88 -oh 72"
#downscale  5 Mpix "2592 1944"
elif [ $TESTYPE = "5MPto5MP" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPto5MP_2592x1944_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "5MPtoQXGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoQXGA_2048x1536_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "5MPtoUXGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoUXGA_1600x1200_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "5MPtoSXGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoSXGA_1280x960_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "5MPtoXGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoXGA_1024x768_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "5MPtoSVGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoSVGA_800x600_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "5MPtoVGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoVGA_640x488_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "5MPtoQVGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoQVGA_648x488_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "5MPtoQCIF" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoQCIF_648x488_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "5MPtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoQQVGA_648x488_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "5MPtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoSQCIF_648x488_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "5MPtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPtoQQCIF_648x488_UYVY.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 88 -oh 72"
#downscale QXGA "2048 1536"
elif [ $TESTYPE = "QXGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAoQXGA_2048x1536_UYVY.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "QXGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoUXGA_1600x1200_UYVY.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "QXGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoSXGA_1280x960_UYVY.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "QXGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoXGA_1024x768_UYVY.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "QXGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoSVGA_800x600_UYVY.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "QXGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoVGA_640x480_UYVY.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "QXGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoQVGA.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "QXGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoQCIF.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "QXGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoQQVGA.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "QXGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoSQCIF.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "QXGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAtoQQCIF.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 88 -oh 72"
#downscale UXGA "1600 1200"
elif [ $TESTYPE = "UXGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoUXGA_1600x1200_UYVY.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "UXGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoSXGA_1280x960_UYVY.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "UXGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoXGA1024x768_UYVY.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "UXGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoSVGA_800x600_UYVY.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "UXGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoVGA_640x480_UYVY.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "UXGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoQVGA.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "UXGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoQCIF.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "UXGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoQQVGA.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "UXGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoSQCIF.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "UXGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoQQCIF.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 88 -oh 72"
#downscale SXGA "1280 960"
elif [ $TESTYPE = "SXGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoSXGA_1280x960_UYVY.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "SXGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoXGA_1024x768_UYVY.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "SXGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoSVGA_800x600_UYVY.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "SXGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoVGA_640x480_UYVY.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "SXGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoQVGA_320x240_UYVY.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "SXGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoQCIF.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "SXGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoQQVGA.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "SXGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoSQCIF.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "SXGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoQQCIF.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 88 -oh 72"
#downscale XGA "1024 768"
elif [ $TESTYPE = "XGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoXGA_1024x768_UYVY.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "XGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoSVGA_800x600_UYVY.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "XGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoVGA_640x488_UYVY.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "XGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoQVGA_320x240_UYVY.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "XGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoQCIF.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "XGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoQQVGA.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "XGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoSQCIF.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "XGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoQQCIF.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 88 -oh 72"
#downscale  SVGA "800 600"
elif [ $TESTYPE = "SVGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoSVGA_800x600_UYVY.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "SVGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoVGA_640x488_UYVY.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "SVGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoQVGA_320x240_UYVY.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "SVGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoQCIF.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "SVGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoQQVGA.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "SVGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoSQCIF.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "SVGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoQQCIF.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 88 -oh 72"
#downscale VGA "640 480"
elif [ $TESTYPE = "VGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoVGA_640x488_UYVY.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "VGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoQVGA_320x240_UYVY.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "VGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoQCIF_176x144_UYVY.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "VGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoQQVGA_160x120_UYVY.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "VGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoSQCIF.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "VGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoQQCIF.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 88 -oh 72"
#downscale QVGA "320 240"
elif [ $TESTYPE = "QVGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoQVGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "QVGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoQCIF.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "QVGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoQQVGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "QVGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoSQCIF.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "QVGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoQQCIF.yuv"
  INSIZE="-iw 320 -ih 240"
  OUTSIZE="-ow 88 -oh 72"
#downscale QCIF "176 144"
elif [ $TESTYPE = "QCIFtoQCIF" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoQCIF.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "QCIFtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoQQVGA.yuv"
  INSIZE="-iw 176 -ih 144"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "QCIFtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoSQCIF.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "QCIFtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoQQCIF.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 88 -oh 72"
#downscale QQVGA "160 120"
elif [ $TESTYPE = "QQVGAtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoQQVGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "QQVGAtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoSQCIF.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "QQVGAtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoQQCIF.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 88 -oh 72"
#downscale SQCIF "128 96"
elif [ $TESTYPE = "SQCIFtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoSQCIF.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 128 -oh 96"
elif [ $TESTYPE = "SQCIFtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoQQCIF.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 88 -oh 72"

elif [ $TESTYPE = "QQCIFtoQQCIF" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoQQCIF.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 88 -oh 72"

#upscale QQCIF "88 72"
elif [ $TESTYPE = "QQCIFto8MP" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFto8MP.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "QQCIFto5MP" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFto5MP.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "QQCIFtoQXGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoQXGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "QQCIFtoUXGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoUXGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "QQCIFtoSXGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoSXGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "QQCIFtoXGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoXGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "QQCIFtoSVGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoSVGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "QQCIFtoVGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoVGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "QQCIFtoQVGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoQVGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "QQCIFtoQCIF" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoQCIF.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "QQCIFtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoQQVGA.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 160 -oh 120"
elif [ $TESTYPE = "QQCIFtoSQCIF" ]; then
  FIN="${TESTSCRIPT}/QQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQCIFtoSQCIF.yuv"
  INSIZE="-iw 88 -ih 72"
  OUTSIZE="-ow 128 -oh 96"
#upscale SQCIF "128 96"
elif [ $TESTYPE = "SQCIFto8MP" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFto8MP.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "SQCIFto5MP" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFto5MP.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "SQCIFtoQXGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoQXGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "SQCIFtoUXGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoUXGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "SQCIFtoSXGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoSXGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "SQCIFtoXGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoXGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "SQCIFtoSVGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoSVGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "SQCIFtoVGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoVGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "SQCIFtoQVGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoQVGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "SQCIFtoCIF" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoCIF_352x288.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 352 -oh 288"
elif [ $TESTYPE = "SQCIFtoQCIF" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoQCIF.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 176 -oh 144"
elif [ $TESTYPE = "SQCIFtoQQVGA" ]; then
  FIN="${TESTSCRIPT}/SQCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SQCIFtoQQVGA.yuv"
  INSIZE="-iw 128 -ih 96"
  OUTSIZE="-ow 160 -oh 120"
#upscale QQVGA "160 120"
elif [ $TESTYPE = "QQVGAto8MP" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAto8MP.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "QQVGAto5MP" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAto5MP.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "QQVGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoQXGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "QQVGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoUXGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "QQVGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoSXGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "QQVGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoXGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "QQVGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoSVGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "QQVGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoVGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "QQVGAtoQVGA" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoQVGA.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 320 -oh 240"
elif [ $TESTYPE = "QQVGAtoQCIF" ]; then
  FIN="${TESTSCRIPT}/QQVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QQVGAtoQCIF.yuv"
  INSIZE="-iw 160  -ih 120"
  OUTSIZE="-ow 176 -oh 144"
#upscale QCIF "176 144"
elif [ $TESTYPE = "QCIFto8MP" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFto8MP.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "QCIFto5MP" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFto5MP.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "QCIFtoQXGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoQXGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "QCIFtoUXGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoUXGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "QCIFtoSXGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoSXGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "QCIFtoXGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoXGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "QCIFtoSVGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoSVGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "QCIFtoVGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoVGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 640 -oh 480"
elif [ $TESTYPE = "QCIFtoQVGA" ]; then
  FIN="${TESTSCRIPT}/QCIFrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QCIFtoQVGA.yuv"
  INSIZE="-iw 176  -ih 144"
  OUTSIZE="-ow 320 -oh 240"
#upscale QVGA "320 240"
elif [ $TESTYPE = "QVGAto8MP" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAto8MP.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "QVGAto5MP" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAto5MP.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "QVGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoQXGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "QVGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoUXGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "QVGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoSXGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "QVGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoXGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "QVGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoSVGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 800 -oh 600"
elif [ $TESTYPE = "QVGAtoVGA" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAtoVGA.yuv"
  INSIZE="-iw 320  -ih 240"
  OUTSIZE="-ow 640 -oh 480"
#upscale VGA "640 480"
elif [ $TESTYPE = "VGAto8MP" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAto8MP.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "VGAto5MP" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAto5MP.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "VGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoQXGA.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "VGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoUXGA.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "VGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoSXGA.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "VGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoXGA.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 1024 -oh 768"
elif [ $TESTYPE = "VGAtoSVGA" ]; then
  FIN="${TESTSCRIPT}/VGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_VGAtoSVGA.yuv"
  INSIZE="-iw 640  -ih 480"
  OUTSIZE="-ow 800 -oh 600"
#upscale SVGA "800 600"
elif [ $TESTYPE = "SVGAto8MP" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAto8MP.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "SVGAto5MP" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAto5MP.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "SVGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoQXGA.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "SVGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoUXGA.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "SVGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoSXGA.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 1280 -oh 960"
elif [ $TESTYPE = "SVGAtoXGA" ]; then
  FIN="${TESTSCRIPT}/SVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SVGAtoXGA.yuv"
  INSIZE="-iw 800  -ih 600"
  OUTSIZE="-ow 1024 -oh 768"
#upscale XGA "1024 768"
elif [ $TESTYPE = "XGAto8MP" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAto8MP.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "XGAto5MP" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAto5MP.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "XGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoQXGA.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "XGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoUXGA.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 1600 -oh 1200"
elif [ $TESTYPE = "XGAtoSXGA" ]; then
  FIN="${TESTSCRIPT}/XGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_XGAtoSXGA.yuv"
  INSIZE="-iw 1024 -ih 768"
  OUTSIZE="-ow 1280 -oh 960"
#upscale SXGA "1280 960"
elif [ $TESTYPE = "SXGAto8MP" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAto8MP.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "SXGAto5MP" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAto5MP.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "SXGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoQXGA.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 2048 -oh 1536"
elif [ $TESTYPE = "SXGAtoUXGA" ]; then
  FIN="${TESTSCRIPT}/SXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_SXGAtoUXGA.yuv"
  INSIZE="-iw 1280 -ih 960"
  OUTSIZE="-ow 1600 -oh 1200"
#upscale UXGA "1600 1200"
elif [ $TESTYPE = "UXGAto8MP" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAto8MP.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "UXGAto5MP" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAto5MP.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 2592 -oh 1944"
elif [ $TESTYPE = "UXGAtoQXGA" ]; then
  FIN="${TESTSCRIPT}/UXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_UXGAtoQXGA.yuv"
  INSIZE="-iw 1600 -ih 1200"
  OUTSIZE="-ow 2048 -oh 1536"
#upscale QXGA "2048 1536"
elif [ $TESTYPE = "QXGAto8MP" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAto8MP.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 3280 -oh 2464"
elif [ $TESTYPE = "QXGAto5MP" ]; then
  FIN="${TESTSCRIPT}/QXGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QXGAto5MP.yuv"
  INSIZE="-iw 2048 -ih 1536"
  OUTSIZE="-ow 2592 -oh 1944"
#upscale 5MP "2592 1944"
elif [ $TESTYPE = "5MPto8MP" ]; then
  FIN="${TESTSCRIPT}/5MPrsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_5MPto8MP.yuv"
  INSIZE="-iw 2592 -ih 1944"
  OUTSIZE="-ow 3280 -oh 2464"

elif [ $TESTYPE = "QVGAto1248x932" ]; then
  FIN="${TESTSCRIPT}/QVGArsz.yuv"
  FNAME="${TMPBASE}/rszhq_out_QVGAto1248x932.yuv"
  INSIZE="-iw 320 -ih 240"
  OUTSIZE="-ow 1248 -oh 932"
fi

${TESTBIN}/reszhq -ifile $FIN -ofile $FNAME $INSIZE $OUTSIZE
RESULT=$?
echo "Test returned $RESULT"
sleep 1
chmod 744 $FNAME

if [ $? -eq 1 ]; then
  #color output - The outpu file wasn't created
  echo -en "Failed to chmod the $FNAME \n"
  echo -en "\033[0;31m FAIL \033[0m \n"
  exit 1
fi

#initialize ERR var with PASS
ERR=0

if [ $RESULT -eq 255 ]; then
  ERR=1
elif [ -z "$STRESS" ]; then
  echo "";echo "Was resizer capable of changing $FIN \
  with $INSIZE size to $OUTSIZE size into $FNAME file?";echo ""
  $WAIT_ANSWER
  ERR=$?
fi
if [ $ERR -eq 1 ]; then
  #color output
  echo -en "\033[0;31m FAIL \033[0m \n"
  #echo "FAIL"
  exit 1
else
  echo -en "\033[0;32m PASS \033[0m \n"
  #echo "PASS"
  exit 0
fi

