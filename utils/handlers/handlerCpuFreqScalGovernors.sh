#!/bin/sh

# =============================================================================
# Variables
# =============================================================================

LOCAL_OPERATION=$1

# =============================================================================
# Functions
# =============================================================================

setOneGovernor() {

	LOCAL_GOVERNOR=$1
	LOCAL_COMMAND_LINE=$2

	if [ -n $LOCAL_COMMAND_LINE ]; then
		eval $LOCAL_COMMAND_LINE &
	fi

	echo $LOCAL_GOVERNOR > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	if [ $? != 0 ]; then
		echo "Info: Error! Governor $i cannot be set"
	else
		echo "Info: Governor $LOCAL_GOVERNOR was correctly set"
	fi

	wait

	sleep 5
}

setAllGovernor() {

	LOCAL_COMMAND_LINE=$1

	error=0
	echo > $HCFSG_GOVERNORS_LIST_OK
	echo > $HCFSG_GOVERNORS_LIST_ERROR

	LOCAL_GOVERNORS_LIST_AVAILABLE=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors`

	if [ -n $LOCAL_COMMAND_LINE ]; then
		$LOCAL_COMMAND_LINE &
		LOCAL_COMMAND_PID=`echo $!`
	fi

	while [ 1 ]; then

		for i in $LOCAL_GOVERNORS_LIST_AVAILABLE

		do
			echo "Setting Governor to" $i
			echo $i > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
			if [ $? != 0 ]; then
				echo "Info: Error! Governor $i cannot be set"
				echo $i >> $HCFSG_GOVERNORS_LIST_ERROR
				error=1
			else
				echo "Info: Governor $i was correctly set"
				echo $i >> $HCFSG_GOVERNORS_LIST_OK
			fi
		done

		if [ -n $LOCAL_COMMAND_LINE ]; then
			test -d /proc/$LOCAL_COMMAND_PID || break
		else
			break
		fi
	done

	wait

	echo "Info: The following governors were correctly set"
	cat $HCFSG_GOVERNORS_LIST_OK
	echo "Info: The following governors were not correctly set"
	cat $HCFSG_GOVERNORS_LIST_ERROR

	sleep 5

	if [ $error -eq 1 ]; then
		exit 1
	fi
}

# =============================================================================
# Main
# =============================================================================

if [ "$LOCAL_OPERATION" = "set" ]; then

	LOCAL_GOVERNOR=$2

	if [ "$LOCAL_GOVERNOR" = "all" ]; then
		setAllGovernors
	else
		setOneGovernor $LOCAL_GOVERNOR
	fi

elif [ "$LOCAL_OPERATION" = "run" ]; then

	LOCAL_GOVERNOR=$2
	LOCAL_COMMAND_LINE=$3

	if [ "$LOCAL_GOVERNOR" = "all" ]; then
		setAllGovernors $LOCAL_COMMAND_LINE
	else
		setOneGovernor $LOCAL_GOVERNOR $LOCAL_COMMAND_LINE
	fi

fi

# End of ile