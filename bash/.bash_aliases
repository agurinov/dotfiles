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
tgrep() {
	perl -le '$g = shift @ARGV;
		$g =~ /(\d\d):(\d\d)/ or die "bad grep\n";
		$gh = $1;
		$gm = $2;
		for my $f (@ARGV) {
			$h = `head -n1 $f`;
			$h =~ /[^\d](\d\d):(\d\d):(\d\d)[^\d]/ or next;

			$hh = $1;
			$hm = $2;

			$t = `tail -n2 $f | head -n1`;
			$t =~ /[^\d](\d\d):(\d\d):(\d\d)[^\d]/ or next;
			$th = $1;
			$tm = $2;
			if ($hh > $th and $hh == 23 and $gh != 23) {
				$hh = 0;
				$hm = 0;
			}
			if ($hh < $gh and $gh < $th) {
				print $f;
			} elsif ($hh == $gh) {
				if ($hm <= $gm) {
					print $f;
				}
			} elsif ($gh == $th) {
				if ($gm <= $tm) {
					print $f;
				}
			}
		}' "$@" 2>/dev/null
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
