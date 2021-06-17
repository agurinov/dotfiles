# Some checks to filter components that should be installed.
UNAME := $(shell uname -s;)
HAS_bash := $(shell command -v bash;)
HAS_tmux := $(shell command -v tmux;)
HAS_vim := $(shell command -v vim;)
HAS_git := $(shell command -v git;)
HAS_ctags := $(shell command -v ctags;)
HAS_golang := $(shell command -v go;)

# Two kinds of components available: dotfiles and bootstrap
# dotfiles:  installed via `make`
# bootstrap: installed via `make ${COMPONENT}`
DOTFILES := scripts editorconfig
BOOTSTRAP :=

ifeq ($(UNAME),Darwin)
	DOTFILES := $(DOTFILES) macos
endif
ifdef HAS_bash
	DOTFILES := $(DOTFILES) bash
endif
ifdef HAS_tmux
	DOTFILES := $(DOTFILES) tmux
endif
ifdef HAS_vim
	DOTFILES := $(DOTFILES) vim
endif
ifdef HAS_git
	DOTFILES := $(DOTFILES) git
endif
ifdef HAS_ctags
	DOTFILES := $(DOTFILES) ctags
endif
ifdef HAS_golang
	BOOTSTRAP := $(BOOTSTRAP) golang
endif

.PHONY: dotfiles $(DOTFILES) $(BOOTSTRAP)

.DEFAULT_GOAL := dotfiles
dotfiles: $(DOTFILES)

$(DOTFILES):
	@$(MAKE) -j --no-print-directory -C $@ dotfiles

$(BOOTSTRAP):
	@$(MAKE) -j --no-print-directory -C $@ bootstrap
