#!/bin/sh

# Testsuite variables
export POSTFIX=`date "+%Y%m%d-%H%M%S"`
export TESTROOT=${PWD}
export TESTBIN=${PWD}/../bin
export TESTLIB=${PWD}/../lib
export TESTSCRIPT=${PWD}/helper
export MODDIR=${PWD}/../modules
export TMPBASE=${TESTROOT}/tmp
export TMPFILE=${TMPBASE}/tmp.$POSTFIX
export CMDFILE=cmd.$POSTFIX
export TESTDIR=${TESTROOT}/test
export PRETTY_PRT=""
export VERBOSE=""
export OUTPUTFILE=${TESTROOT}/output.$POSTFIX
export LOGFILE=${TESTROOT}/log.$POSTFIX
export PATH="${TESTROOT}:${TESTBIN}:${TESTSCRIPT}:${PATH}"
export TC_SCENARIO="${TESTROOT}/scenarios"
export SCENARIO_NAMES=""
export INTERACTIVE=""
export STRESS=""
export UTILBIN=${TESTROOT}/../../utils/bin
export DEBUG_DIR=/debug/
export POWERSYSFS=/sys/power
if [ -f "/sys/power/wakeup_timer_seconds" ] #is this power entry in sysfs?
then #if yes, we can look in /sys/power for all entries
       export POWER_ENTRIES=$POWERSYSFS
else #if not, they must be in debugfs and it should be mounted
       if [ ! -d $DEBUG_DIR ]; then mkdir $DEBUG_DIR; fi;
       if [ ! `mount | grep debugfs` ]; then mount -t debugfs debugfs /debug; fi;
       export POWER_ENTRIES=$DEBUG_DIR/pm_debug/
fi

# Modules
export MODNAME="omap_gpadc_test"
export GPADC_MODULE="$MODDIR/$MODNAME.ko"
export MODIRQNAME="omap_gpadc_sw_irq_test"
export GPADC_IRQ_MODULE="$MODDIR/$MODIRQNAME.ko"
export MODSMPNAME="omap_gpadc_smp_test"
export GPADC_SMP_MODULE="$MODDIR/$MODSMPNAME.ko"

# Specific Variables
export DELAY=5
export MESSAGE_DELAY=3
export TAG=""
export PLACE=""
export COMMAND=""
export VALUE=""
export TEMP=""
export TX=""
export RX=""
export TRANSFER=""

# Parameters
export McBSP_INTERFACES="0 1 2 3 4"
#export McBSP_INTERFACES="1 0 2"
export SAMPLE_RATES="8000 11025 12000 16000 22050 24000 32000 44100 48000"
export PHASE_VALUES="1 2"
#export WORDS_PER_FRAME="0 1 2 3 4 5 6 7 8 9 10"
export WORDS_PER_FRAME="1 2"
export CLKR_POLARITY_VALUES="1 2"
export FSR_POLARITY_VALUES="0 1"
export CLKX_POLARITY_VALUES="1 2"
export FSX__POLARITY_VALUES="0 1"
export BUFFER_SIZE_VALUES="256 512 1024 2048 4096"
export TRANSFER_VALUES="10 100 1000"
#export WORD_LENGTH_VALUES="0 1 2 3 4 5"
export WORD_LENGTH_VALUES="0 2 5"
export JUSTIFICATION_VALUES="0 1 2"
