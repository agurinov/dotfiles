.PHONY: all
all: tree files ftplugin plugins minisnip

.PHONY: tree
tree:
	rm -rf $(HOME)/.vim
	mkdir $(HOME)/.vim
	mkdir $(HOME)/.vim/ftplugin
	mkdir $(HOME)/.vim/minisnip
	mkdir $(HOME)/.vim/autoload

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
