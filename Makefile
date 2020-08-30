COMPONENTS := bash scripts vim tmux zsh

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	$(MAKE) -C $@
