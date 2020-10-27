# First loaded file when interactive login shell.

if [ -r ~/.profile ]; then
	. ~/.profile
fi

if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
	. ~/.bashrc
fi

