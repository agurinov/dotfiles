alias ll='ls -lAhF'
alias g='git'

alias du='du -h'
alias df='df -h'

# https://ru.wikipedia.org/wiki/Find#Список_ключей
alias fclear='find . -maxdepth 1 -type f -mtime +10 -print -delete'
alias fname='find . -type f -name'

# -n is for print line
# -H is for print filename
alias grep='grep -n -H --color'
alias fgrep='fgrep -n -H --color'
alias egrep='egrep -n -H --color'

function rpmfind() {
	RPM_HOST='http://pkg.corp.mail.ru'

	wget "${RPM_HOST}/find.rpm.list.txt" -O - 2>/dev/null | \
	awk -v rpm_host="${RPM_HOST}" '{ print rpm_host "/" $0 }' | \
	\fgrep --color $@
}
