.PHONY: install uninstall

install: .bash_profile .bashrc
	cp .bash_profile ~/.bash_profile
	cp .bashrc ~/.bashrc

uninstall:
	rm ~/.bash_profile
	rm ~/.bashrc
