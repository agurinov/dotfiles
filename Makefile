COMPONENTS := bash scripts tmux vim editorconfig

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	$(MAKE) -C $@
