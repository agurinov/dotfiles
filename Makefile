.PHONY: bash vim tmux

bash: bash/.bash_profile bash/.bashrc
	cp bash/.bash_profile ~/.bash_profile
	cp bash/.bashrc ~/.bashrc

vim:
	$(MAKE) -C vim

tmux: tmux/.tmux.conf
	cp tmux/.tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf
