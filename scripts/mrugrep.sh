#!/usr/bin/env bash
set -eu

SERVICE=$1
#DATE=$2
#TIME=$3
#CRITERIA=$4

# check checks that script can be properly run at this system.
function check() {
	# All required binaries exists.
	required_bins='awk date'
	for bin in $required_bins; do
		if [[ -z `command -v $bin` ]]; then
			echo "\`$bin\` required"
			exit 1
		fi
	done
}
check

# GLOBS is the global files related to service.
# this globs will be filtered by date or time as first index.
case ${SERVICE} in

	# grepmaillog14
	# log entry example:
	# '2020-10-23T18:00:05.646841+03:00 totem-refresh[PID]: {JSON}'
	'totem-refresh' )
		GLOBS=(
			/mnt/maillogs/ovod{1,2,3,10,11}/totem-refresh.log
			/mnt/maillogs/ovod{1,2,3,10,11}/totem-refresh.log*
		)
		AWK_SEPARATOR='[ T]'
		;;

	* )
		echo "Unknown service \`${SERVICE}\`"
		exit 1
		;;
esac

# filter_log_files_by_datetime returns list of files with correct date and time.
function filter_log_files_by_datetime() {
			first='2020-10-23T18:00:05.646841+03:00 totem-refresh[7855]: {...}'
			last='2020-10-23T19:00:02.641066+03:00 totem-refresh[7855]: {...}'

			# Use datetime pattern in this log files to determine range.
			echo $first | awk -F "$AWK_SEPARATOR" '{print $1; print $2}'
			echo $last | awk -F "$AWK_SEPARATOR" '{print $1; print $2}'

	#for filename in ${GLOBS[@]}; do
	#	if [[ -r $filename ]]; then
	#		#first=`head -1 $filename`
	#		#last=`tail -1 $filename`
	#	fi
	#done
}

# Get log files than may contain useful information.
filter_log_files_by_datetime

#PROPER_LOG_FILES=$(filter_log_files_by_datetime)
#
#echo 'Log files to observe:'
#for filename in $PROPER_LOG_FILES; do
#	echo ${filename}
#done

# Grep this files by criteria.
# If no date and time provided - use tail logic (realtime monitoring).
# Grep is running in parallel.
