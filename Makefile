# Some checks to filter components to install on this environment.
UNAME := $(shell uname -s;)
HAS_bash := $(shell command -v bash;)
HAS_tmux := $(shell command -v tmux;)
HAS_vim := $(shell command -v vim;)
HAS_git := $(shell command -v git;)

COMPONENTS := scripts editorconfig
ifdef HAS_bash
	COMPONENTS := $(COMPONENTS) bash
endif
ifdef HAS_tmux
	COMPONENTS := $(COMPONENTS) tmux
endif
ifdef HAS_vim
	COMPONENTS := $(COMPONENTS) vim
endif
ifdef HAS_git
	COMPONENTS := $(COMPONENTS) git
endif
ifeq ($(UNAME),Darwin)
	COMPONENTS := $(COMPONENTS) macos
endif

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	@$(MAKE) -C $@
