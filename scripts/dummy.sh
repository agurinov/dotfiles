#!/usr/bin/env sh
set -eu -o pipefail

# Check that script can be properly run at this system.
function check() {
	echo 'Checking system...'
	# All required binaries exists.
	# command -V tar
	echo 'Checked successfully!'
}
check

TMP_DIR=`mktemp -d`
function cleanup() {
	echo
	echo 'Cleaning...'
	echo $TMP_DIR
	echo 'Cleaned successfully!'
}
trap cleanup EXIT

echo
echo 'Working...'
echo 'I am working'
echo $TMP_DIR
if true; then
	echo 'core!'
	exit 1
fi
echo 'Worked successfully!'
