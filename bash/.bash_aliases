# user defined aliases.
# NOTE: this file is source'd so all functions will also be available to call
# from terminal

alias ls='ls -lAhF'
alias g='git'

alias ff='find . -type f -name'
alias clearold='find . -maxdepth 1 -type f -mtime +10 -print -delete'

# Grep aliases.
# -n is for print line
# -H is for print filename
alias grep='grep -n -H --color'
alias fgrep='fgrep -n -H --color'
alias egrep='egrep -n -H --color'

function rpmfind() {
	wget http://pkg.corp.mail.ru/find.rpm.list.txt -O - 2>/dev/null | \
	awk '{ print "http://pkg.corp.mail.ru/," $0 }' | \
	fgrep -h $@
}

