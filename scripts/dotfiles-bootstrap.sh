#!/usr/bin/env bash
set -eux

# Use latest environment files.
if [ -d "${HOME}/dotfiles/.git" ]; then
	git \
		--git-dir="${HOME}/dotfiles/.git" \
		--work-tree="${HOME}/dotfiles" \
		pull \
		origin master
else
	git clone \
		https://github.com/agurinov/dotfiles \
		"${HOME}/dotfiles"
fi

make -C "${HOME}/dotfiles"

