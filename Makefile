# Some checks to filter components that should be installed.
UNAME := $(shell uname -s;)
HAS_bash := $(shell command -v bash;)
HAS_tmux := $(shell command -v tmux;)
HAS_vim := $(shell command -v vim;)
HAS_git := $(shell command -v git;)
HAS_ctags := $(shell command -v ctags;)
HAS_golang := $(shell command -v go;)

# Two kinds of components available: auto and manual
# auto:   installed via default target `make`
# manual: installed via manual command `make ${MODULE}`
AUTO := scripts editorconfig
MANUAL :=

ifdef HAS_bash
	AUTO := $(AUTO) bash
endif
ifdef HAS_tmux
	AUTO := $(AUTO) tmux
endif
ifdef HAS_vim
	AUTO := $(AUTO) vim
endif
ifdef HAS_git
	AUTO := $(AUTO) git
endif
ifdef HAS_ctags
	AUTO := $(AUTO) ctags
endif
ifeq ($(UNAME),Darwin)
	AUTO := $(AUTO) macos
endif

ifdef HAS_golang
	MANUAL := $(MANUAL) golang
endif

.PHONY: all $(AUTO) $(MANUAL)

all: $(AUTO)

$(AUTO) $(MANUAL):
	@$(MAKE) -C $@
