COMPONENTS := bash scripts vim tmux

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	$(MAKE) -C $@
