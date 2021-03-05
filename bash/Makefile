.PHONY: all
all: files apply

.PHONY: files
files: .bashrc .bash_profile .bash_aliases
	cp -f $^ $(HOME)
	
.PHONY: files
files: .bash_profile
	source $^
