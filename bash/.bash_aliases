# user defined aliases.
# NOTE: this file is source'd so all functions will also be available to call
# from terminal

alias ll='ls -lAhF --color=auto'
alias g='git'

alias du='du -h'
alias df='df =h'

alias clearold='find . -maxdepth 1 -type f -mtime +10 -print -delete'
alias fname='find . -type f -name'

# Grep aliases.
# -n is for print line
# -H is for print filename
alias grep='grep -n -H --color'
alias fgrep='fgrep -n -H --color'
alias egrep='egrep -n -H --color'

function rpmfind() {
	wget http://pkg.corp.mail.ru/find.rpm.list.txt -O - 2>/dev/null | \
	awk '{ print "http://pkg.corp.mail.ru/" $0 }' | \
	\fgrep --color $@
}
