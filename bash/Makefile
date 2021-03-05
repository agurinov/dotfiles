.PHONY: all
all: files apply

.PHONY: files
files: .bashrc .bash_profile .bash_aliases
	cp -f $^ $(HOME)
	
.PHONY: apply
apply: $(HOME)/.bash_profile
	source $^
