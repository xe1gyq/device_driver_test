#!/bin/sh

# Testsuite variables
export POSTFIX=`date "+%Y%m%d-%H%M%S"`
export TESTROOT=${PWD}
export TESTLIB=${PWD}/../lib
export TESTSCRIPT=${PWD}/helper
export TMPBASE=${TESTROOT}/tmp
export TMPFILE=${TMPBASE}/tmp.$POSTFIX
export CMDFILE=cmd.$POSTFIX
export TESTDIR=${TESTROOT}/test
export PRETTY_PRT=""
export VERBOSE=""
export OUTPUTFILE=${TESTROOT}/output.$POSTFIX
export LOGFILE=${TESTROOT}/log.$POSTFIX
export DURATION=""
export PATH="${TESTROOT}:${TESTBIN}:${TESTSCRIPT}:${PATH}"
export TC_SCENARIO="${TESTROOT}/scenarios"
export SCENARIO_NAMES=""
export INTERACTIVE=""
export STRESS=""
export MOUNT_POINT=/mnt/nfsmount/
export UTILBIN=${TESTROOT}/../../utils/bin
export UTILSCRIPTS=${TESTROOT}/../../utils/scripts

# Utils General Variables
. ${TESTROOT}/../../utils/configuration/general.configuration
# Specific Ethernet Variables
export PACKET_SIZE=32768
# Checking if bc is available in the filesystem

if [ ! `echo 1+1 | bc` ]; then
	echo "FATAL: BC unavailable, cannot continue"
fi

# End of file