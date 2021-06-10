alias ll='ls -lAhF'
alias g='git'

alias du='du -h'
alias df='df -h'

# -I -- process a binary file as if it did not contain matching data;
# -n -- prefix each line of output with the 1-based line number within its input file;
# -H -- print the file name for each match;
alias grep='grep -I -n -H --color'
alias fgrep='grep -F'
alias egrep='grep -E'
function rgrep() {
	fgrep -R "'$1'" ${2:-.}
}

# https://ru.wikipedia.org/wiki/Find#Список_ключей
alias fclear='find . -maxdepth 1 -type f -mtime +10 -print -delete'
alias fname='find . -type f -name'

function rpmfind() {
	RPM_HOST='http://pkg.corp.mail.ru'

	wget "${RPM_HOST}/find.rpm.list.txt" -O - 2>/dev/null | \
	awk -v rpm_host="${RPM_HOST}" '{ print rpm_host "/" $0 }' | \
	\fgrep --color $@
}
