#!/usr/bin/env bash
set -eux

# Remote sources.
GIT_URL='https://github.com/agurinov/dotfiles.git'
ZIP_URL='https://github.com/agurinov/dotfiles/archive/master.zip'
TAR_URL='https://github.com/agurinov/dotfiles/archive/master.tar.gz'

# Local copies.
GIT_DIR="${HOME}/dotfiles/.git"
GIT_WORK_TREE="${HOME}/dotfiles"

# dotfiles_reset just ensures that dotfiles dir
# will be present and empty.
function dotfiles_reset() {
	rm -rf ${GIT_WORK_TREE}
	mkdir -p $GIT_WORK_TREE
}

# dotfiles_install_git installs source code via git.
function dotfiles_install_git() {
	if [ -d "${HOME}/dotfiles/.git" ]; then
		# git repo initialized, reset all changes.
		git \
			--git-dir=$GIT_DIR \
			--work-tree=$GIT_WORK_TREE \
			clean -fxd

		git \
			--git-dir=$GIT_DIR \
			--work-tree=$GIT_WORK_TREE \
			pull \
			origin master
	else
		dotfiles_reset

		git clone \
			$GIT_URL \
			$GIT_WORK_TREE
	fi
}

# dotfiles_install_curl uses curl to download sources as tar.
function dotfiles_install_curl() {
	dotfiles_reset

	curl $TAR_URL \
		--location \
		--create-dirs \
		--output ${GIT_WORK_TREE}/dotfiles.tar.gz \
		--fail # return nonzero exit code if 404 or any error from server.

	tar -xv \
		--strip 1 \
		-f ${GIT_WORK_TREE}/dotfiles.tar.gz \
		-C ${GIT_WORK_TREE}

	rm -rf ${GIT_WORK_TREE}/dotfiles.tar.gz
}

# dotfiles_install_curl wget curl to download sources as tar.
function dotfiles_install_wget() {
	dotfiles_reset

	wget $TAR_URL \
		--quiet \
		-O ${GIT_WORK_TREE}/dotfiles.tar.gz

	tar -xv \
		--strip 1 \
		-f ${GIT_WORK_TREE}/dotfiles.tar.gz \
		-C ${GIT_WORK_TREE}

	rm -rf ${GIT_WORK_TREE}/dotfiles.tar.gz
}

# Choose proper way to get source files.
if [ -n `command -v git` ]; then
	dotfiles_install_git
elif [ -n `command -v curl` ]; then
	dotfiles_install_curl
elif [ -n `command -v wget` ]; then
	dotfiles_install_wget
else
	echo 'Cannot get dotfiles sources'
	exit 1
fi

# Install them on system.
make -C "${HOME}/dotfiles"

