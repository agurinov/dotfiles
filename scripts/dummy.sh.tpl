#!/usr/bin/env sh
set -eu -o pipefail

# Check that script can be properly run at this system.
function check() {
	echo 'Checking system...'
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
echo 'Working...'
sleep 60
echo 'Worked successfully!'
