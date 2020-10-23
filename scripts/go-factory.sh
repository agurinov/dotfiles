#!/usr/bin/env bash
set -eu

VERSION=$2

# Script requires root permissions.
if [[ ! -w /usr/local ]]; then
	echo 'Permission denied on /usr/local'
	exit 1
fi

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
	if [ -d "/usr/local/go${VERSION}/go" ]; then
		ln -sfn /usr/local/go${VERSION}/go /usr/local/go
	else
		echo "Version ${VERSION} not installed."
		echo "Try \`go-factory install ${VERSION}\`"
		exit 1
	fi

	for BIN in 'go' 'gofmt' 'godoc'
	do
		if [ -x "/usr/local/go${VERSION}/go/bin/${BIN}" ]; then
			ln -sf /usr/local/go${VERSION}/go/bin/${BIN} /usr/local/bin/${BIN}
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

