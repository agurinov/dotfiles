.PHONY: all
all: vimrc ftplugin ~/.vim/autoload/plug.vim plugins

.PHONY vimrc
vimrc:
	cp vimrc ~/.vim/vimrc

.PHONY ftplugin
ftplugin:
	cp -R ftplugin/* ~/.vim/ftplugin

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY plugins
plugins:
	vim +PlugInstall +qall
