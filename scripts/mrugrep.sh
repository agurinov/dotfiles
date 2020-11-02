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
		GLOBS=(
			/Users/a.gurinov/dotfiles/ovod{1,2,3,10,11}/totem-refresh.log
		)
		AWK_DATETIME_POSITION='1'
		AWK_DATETIME_FORMAT='%Y-%m-%dT'
		;;

	* )
		echo "Unknown service \`${SERVICE}\`"
		exit 1
		;;
esac

# filter_log_files_by_datetime returns list of files with correct date and time.
function filter_log_files_by_datetime() {
	# Use datetime pattern in this log files to determine range.
	AWK_COMMAND='
		# Extract datetime from first log entry.
		NR == 1 {
			firstdt = $DateTimePosition
		}

		# Check the desired datetime in range of current file.
		END {
			# Extract datetime from last log entry.
			lastdt = $DateTimePosition

			print FILENAME
			print firstdt
			print lastdt
		}
	'

	for filename in ${GLOBS[@]}; do
		if [[ -r $filename ]]; then
			awk \
				-v DateTimePosition="$AWK_DATETIME_POSITION" \
				-v DateTimeFormat="$AWK_DATETIME_FORMAT" \
				"$AWK_COMMAND" $filename
		fi
	done
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
