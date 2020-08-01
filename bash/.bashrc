# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific variables
PS1='\e[0;36m[\e[0;32m${USER}\e[0;36m@MBP:\e[0;34m${PWD}\e[0;36m] $ \e[m' # redeclare prompt
export COMPOSE_INTERACTIVE_NO_CLI=1

# User specific aliases and functions
alias ls='ls -lAhF'
