.PHONY: all bash vim tmux zsh

all: bash vim tmux zsh

bash:
	$(MAKE) -C bash

vim:
	$(MAKE) -C vim

tmux:
	$(MAKE) -C tmux

zsh:
	$(MAKE) -C zsh
