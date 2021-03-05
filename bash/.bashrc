# First loaded file when interactive non-login shell.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Redeclare prompt
PROMPT_COMMAND='twoline_prompt'

Reset='\[\e[0m\]'
RedBlink='\[\e[5;31m\]'
Green='\[\e[0;32m\]'
Blue='\[\e[0;34m\]'
Cyan='\[\e[0;36m\]'

oneline_prompt () {
	PS1="${Cyan}["

	# Check current user is root.
	if [[ $EUID == 0 ]]; then
		PS1+="${RedBlink}"
	else
		PS1+="${Green}"
	fi
	PS1+='\u' # write username

	# Write hostname
	PS1+="${Cyan}@\h:"

	# Write current working dir.
	PS1+="${Blue}${PWD}"

	# Write prompt marker and reset.
	PS1+="${Cyan}] \$ ${Reset}"
}

twoline_prompt () {
	PS1=''

	# Check current user is root.
	if [[ $EUID == 0 ]]; then
		PS1+="${RedBlink}"
	else
		PS1+="${Green}"
	fi
	PS1+='\u' # write username

	# Write hostname
	PS1+="${Reset} at ${Cyan}@\h:"

	# Write current working dir.
	PS1+="${Reset} in ${Blue}${PWD}"

	# Reset color and and write second line.
	PS1+="${Reset}\n"
}

# docker, docker-compose, docker-machine
export COMPOSE_INTERACTIVE_NO_CLI=1

# Load user defined aliases.
if [ -n "$BASH" ] && [ -r ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Use vim as default editor for all.
export VISUAL=vim
export EDITOR="$VISUAL"

PATH="$HOME/bin:$PATH"
