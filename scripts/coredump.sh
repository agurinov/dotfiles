#!/usr/bin/env sh
set -eu -o pipefail

# Check that script can be properly run at this system.
function check() {
	echo 'Checking system...'
	# All required binaries exists.
	command -V gdb
	command -V awk
	command -V tar
	command -V getopts
	echo 'Checked successfully!'
}
check

function args() {
	TO_FILE=
	WITH_RPM=

	while getopts "fr" opt
	do
		case $opt in
			f )
				echo 'Collected core will be written to file.'
				TO_FILE=true
				;;

			r )
				echo 'RPM info will be included.'
				WITH_RPM=true
				;;
		esac
	done
}
args

TMP_DIR=`mktemp -d`
function cleanup() {
	echo
	echo 'Cleaning...'
	rm -rf $TMP_DIR
	echo 'Cleaned successfully!'
}
trap cleanup EXIT

echo
echo 'Collecting core...'

BIN_PATH=$1
CORE_PATH=$2
TAR_NAME='-'

TAR_FILES=${TMP_DIR}/tar_files
echo $BIN_PATH >> ${TAR_FILES}
echo $CORE_PATH >> ${TAR_FILES}

# Collect dynamic libraries from gdb information.
gdb -batch ${BIN_PATH} -c ${CORE_PATH} -ex 'info shared' -ex 'quit' \
	2> /dev/null |
	awk '$NF ~ /^\// {print $NF}' >> ${TAR_FILES}

# TODO: Collect installed rpm state.

echo 'Files to be collected:'
cat $TAR_FILES

if ! [ -z $TO_FILE ]; then
	COMMAND=`basename $BIN_PATH`
	DATETIME=`date +%Y%m%d%H%M`
	TAR_NAME="${COMMAND}-core-${DATETIME}-${HOSTNAME%%.*}.tar.gz"
fi
tar -czh -f ${TAR_NAME} -T ${TAR_FILES}

echo 'Collected successfully!'
echo $TAR_NAME
