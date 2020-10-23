.PHONY: all

all: ./*.sh
	mkdir -p $(HOME)/bin
	for script in $^; do \
		cp -f $${script} $(HOME)/bin/$${script}; \
		chmod +x $(HOME)/bin/$${script}; \
	done
