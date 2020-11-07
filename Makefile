COMPONENTS := bash scripts tmux vim editorconfig macos

.PHONY: all $(COMPONENTS)

all: $(COMPONENTS)

$(COMPONENTS):
	$(MAKE) -C $@
