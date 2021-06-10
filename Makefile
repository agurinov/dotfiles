# Some checks to filter components that should be installed.
UNAME := $(shell uname -s;)
HAS_bash := $(shell command -v bash;)
HAS_tmux := $(shell command -v tmux;)
HAS_vim := $(shell command -v vim;)
HAS_git := $(shell command -v git;)
HAS_ctags := $(shell command -v ctags;)

COMPONENTS := scripts editorconfig

# Components based on the existence of a daemon.
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
ifdef HAS_ctags
	COMPONENTS := $(COMPONENTS) ctags
endif

# Components based on OS.
ifeq ($(UNAME),Darwin)
	COMPONENTS := $(COMPONENTS) macos
endif

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	@$(MAKE) -C $@
