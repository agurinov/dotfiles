#!/usr/bin/env bash
set -eux

# Remote sources.
GIT_URL='https://github.com/agurinov/dotfiles.git'
ZIP_URL='https://github.com/agurinov/dotfiles/archive/master.zip'
TAR_URL='https://github.com/agurinov/dotfiles/archive/master.tar.gz'

# Local copies.
GIT_DIR="${HOME}/dotfiles/.git"
GIT_WORK_TREE="${HOME}/dotfiles"

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
		rm -rf "${GIT_WORK_TREE}/"

		git clone \
			$GIT_URL \
			$GIT_WORK_TREE
	fi
}

# dotfiles_install_curl uses curl to download sources as tar.
function dotfiles_install_curl() {
	curl $TAR_URL \
		--location \
		--create_dirs \
		--output ${GIT_WORK_TREE}/dotfiles.tar.gz \
		--fail # return nonzero exit code if 404 or any error from server.

	tar -xv \
		-f ${GIT_WORK_TREE}/dotfiles.tar.gz \
		-C ${GIT_WORK_TREE}

	rm -rf ${GIT_WORK_TREE}/dotfiles.tar.gz
}

# dotfiles_install_curl wget curl to download sources as tar.
function dotfiles_install_wget() {
	wget https://github.com/User/repo/archive/master.tar.gz
}

# Choose proper way to get source files.
GIT_INSTALLED=`command -v git`
CURL_INSTALLED=`command -v curl`
WGET_INSTALLED=`command -v wget`

dotfiles_install_curl()

# Install them on system.
make -C "${HOME}/dotfiles"

