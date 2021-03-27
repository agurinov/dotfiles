.PHONY: all
all: tree files ftplugin plugins minisnip

.PHONY: tree
tree:
	mkdir -p $(HOME)/.vim
	mkdir -p $(HOME)/.vim/ftplugin
	mkdir -p $(HOME)/.vim/minisnip
	mkdir -p $(HOME)/.vim/autoload
	rm -rf $(HOME)/.vim/minisnip/*
	rm -rf $(HOME)/.vim/autoload/*

.PHONY: files
files: vimrc
	cp -f $^ $(HOME)/.vim

.PHONY: ftplugin
ftplugin: ftplugin/*.vim
	cp -f $^ $(HOME)/.vim/ftplugin

.PHONY: minisnip
minisnip: minisnip/*
	cp -f $^ $(HOME)/.vim/minisnip

.PHONY: plugins
plugins: autoload/plug.vim
	cp -f $^ $(HOME)/.vim/autoload
	vim +PlugUpgrade +PlugInstall +qa!
	rm -f $(HOME)/.vim/autoload/plug.vim.old
