.PHONY: all
all: vimrc ftplugin ~/.vim/autoload/plug.vim plugins

.PHONY: vimrc
vimrc:
	mkdir -p ~/.vim
	cp vimrc ~/.vim/vimrc

.PHONY: ftplugin
ftplugin:
	mkdir -p ~/.vim/ftplugin
	cp -Rf ftplugin/* ~/.vim/ftplugin

~/.vim/autoload/plug.vim:
	cp -f autoload/plug.vim ~/.vim/autoload/plug.vim

.PHONY: plugins
plugins:
	vim +PlugInstall +qall
