.PHONY: all
all: files ftplugin plugins minisnip

.PHONY: files
files: vimrc
	mkdir -p $(HOME)/.vim
	cp -f $^ $(HOME)/.vim

.PHONY: ftplugin
ftplugin: ftplugin/*.vim
	mkdir -p $(HOME)/.vim/ftplugin
	cp -f $^ $(HOME)/.vim/ftplugin

.PHONY: minisnip
minisnip: minisnip/*
	mkdir -p $(HOME)/.vim/minisnip
	cp -f $^ $(HOME)/.vim/minisnip

.PHONY: plugins
plugins: autoload/plug.vim
	mkdir -p $(HOME)/.vim/autoload
	cp -f $^ $(HOME)/.vim/autoload
	vim +PlugUpgrade +PlugInstall +qa!
