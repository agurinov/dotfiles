# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific variables
PS1='\e[0;36m[\e[0;32m${USER}\e[0;36m@MBP \e[0;34m\w\e[0;36m] $ \e[m' # redeclare prompt


# User specific aliases and functions
alias ls='ls -lAhF'
