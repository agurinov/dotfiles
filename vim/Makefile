.PHONY: all plugins vimrc

all: vimrc ~/.vim/autoload/plug.vim plugins

vimrc:
	cp vimrc ~/.vimrc

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

plugins:
	vim +PlugInstall +qall
