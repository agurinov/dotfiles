COMPONENTS := bash scripts tmux vim

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	$(MAKE) -C $@
