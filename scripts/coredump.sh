#!/usr/bin/env sh
set -eu -o pipefail

# Check that script can be properly run at this system.
function check() {
	echo 'Checking system...'
	# All required binaries exists.
	command -V gdb
	command -V awk
	command -V tar
	echo 'Checked successfully!'
}
check

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

COMMAND=`basename $BIN_PATH`
DATETIME=`date +%Y%m%d%H%M`
TAR_NAME="${COMMAND}-core-${DATETIME}-${HOSTNAME%%.*}.tar.gz"

TAR_FILES=${TMP_DIR}/tar_files
echo $BIN_PATH >> ${TAR_FILES}
echo $CORE_PATH >> ${TAR_FILES}

# Collect dynamic libraries from gdb information.
gdb -batch ${BIN_PATH} -c ${CORE_PATH} -ex 'info shared' -ex 'quit' \
	2> /dev/null |
	awk '$NF ~ /^\// {print $NF}' >> ${TAR_FILES}

# TODO: Collect installed rpm state.

echo 'Files to be collected:'
echo $TAR_FILES
tar -czh -f ${TAR_NAME} -T ${TAR_FILES}

echo 'Collected successfully!'
echo $TAR_NAME
