# Add: export ENV=$HOME/.kshrc to .profile  

PKG_PATH=ftp://ftp3.usa.openbsd.org/pub/OpenBSD/5.1/packages/i386/
PS1='[\u@\h \W]\$ '
export PKG_PATH PS1

alias ta='tmux -u attach -d'

bind -m '^L'=clear'^J'
