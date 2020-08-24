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
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: plugins
plugins:
	vim +PlugInstall +qall
