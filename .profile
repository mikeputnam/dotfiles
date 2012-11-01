# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM

PKG_PATH=ftp://mirror.planetunix.net/pub/OpenBSD/snapshots/packages/i386 
PS1='[\u@\h \W]\$ '
export PKG_PATH PS1
alias p='export http_proxy=;mv ~/.ssh/ssh_config ~/.ssh/ssh_configOFF;ssh -p 443 mike@dhmn.net'
alias pb='export http_proxy=http://127.0.0.1:3128;mv ~/.ssh/ssh_configOFF ~/.ssh/ssh_config'
alias pbt='export http_proxy=http://127.0.0.1:8080;mv ~/.ssh/ssh_configOFF ~/.ssh/ssh_config;ssh -L 8080:127.0.0.1:3128 -p 443 mike@dhmn.net'
alias ta='tmux -u attach -d'
bind -m '^L'=clear'^J'
