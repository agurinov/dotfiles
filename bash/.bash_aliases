# user defined aliases.
# NOTE: this file is source'd so all functions will also be available to call
# from terminal

alias ls='ls -lAhF'

alias grep='grep -n --color'
alias fgrep='fgrep -n --color'
alias egrep='egrep -n --color'

function rpmfind() {
	wget http://pkg.corp.mail.ru/find.rpm.list.txt -O - \ 2>/dev/null | \
	perl -pe "s#^#http://pkg.corp.mail.ru/#" | \
	fgrep
}

