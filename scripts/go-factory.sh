#!/usr/bin/env bash
set -eu -o pipefail

# This script installs golang concrete version.
# Install is performed to separate directory so you can
# switch bettwen multiple versions.

VERSION=$2

# check checks that script can be properly run at this system.
function check() {
	# All required binaries exists.
	required_bins='curl tar uname'
	for bin in $required_bins; do
		if [[ -z `command -v $bin` ]]; then
			echo "\`$bin\` required"
			exit 1
		fi
	done

	# Script requires root permissions.
	if [[ ! -w /usr/local ]]; then
		echo 'Permission denied on /usr/local'
		exit 1
	fi
}
check

# Remote sources.
GO_URL=https://dl.google.com/go/go${VERSION}.`uname -s`-amd64.tar.gz

# Local paths.
GO_INSTALL_DIR=/usr/local/go${VERSION}
GO_SRC_TAR=${GO_INSTALL_DIR}/go.tar.gz

# go_install fetches go source code.
function go_install() {
	mkdir -p $GO_INSTALL_DIR

	curl $GO_URL \
		--location \
		--create-dirs \
		--output $GO_SRC_TAR \
		--fail # return nonzero exit code if 404 or any error from server.

	tar -xv \
		--strip 1 \
		-f $GO_SRC_TAR \
		-C $GO_INSTALL_DIR

	rm -f $GO_SRC_TAR
}

# go_switch set links to use concrete golang version.
function go_switch() {
	if [ -d $GO_INSTALL_DIR ]; then
		ln -sfn $GO_INSTALL_DIR /usr/local/go
	else
		echo "Version ${VERSION} not installed."
		echo "Try \`go-factory install ${VERSION}\`"
		exit 1
	fi

	for BIN in 'go gofmt godoc'
	do
		if [ -x ${GO_INSTALL_DIR}/bin/${BIN} ]; then
			ln -sf ${GO_INSTALL_DIR}/bin/${BIN} /usr/local/bin/${BIN}
		else
			rm -f /usr/local/bin/${BIN}
		fi
	done
}

case "$1" in
	'install' )
		go_install
		;;

	'switch' )
		go_switch
		;;

	* )
		echo 'Unknown command. Use `install` or `switch`'
		exit 1
		;;
esac

