#!/usr/bin/env bash
set -eu


VERSION=$2


# go_install fetches go source code.
function go_install() {
	curl https://dl.google.com/go/go${VERSION}.`uname -s`-amd64.tar.gz \
		--location \
		--create_dirs \
		--output /usr/local/go${VERSION}.`uname -s`-amd64.tar.gz \
		--fail # return nonzero exit code if 404 or any error from server.

	mkdir -p /usr/local/go${VERSION}

	tar -xv \
		-f /usr/local/go${VERSION}.`uname -s`-amd64.tar.gz \
		-C /usr/local/go${VERSION}

	rm -rf /usr/local/go${VERSION}.`uname -s`-amd64.tar.gz
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

