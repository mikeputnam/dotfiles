# Add: export ENV=$HOME/.kshrc to .profile  
alias ls='ls -laF'
alias p='export http_proxy=;mv ~/.ssh/config ~/.ssh/configOFF;ssh -p 443 mike@dhmn.net'
alias pb='export http_proxy=http://127.0.0.1:3128;mv ~/.ssh/configOFF ~/.ssh/config'
alias pbt='export http_proxy=http://127.0.0.1:8080;mv ~/.ssh/configOFF ~/.ssh/config;ssh -L 8080:127.0.0.1:3128 -p 443 mike@dhmn.net'
alias ta='tmux -u attach -d'
bind -m '^L'=clear'^J'
export PKG_PATH=ftp://ftp3.usa.openbsd.org/pub/OpenBSD/5.1/packages/i386/
#export PKG_PATH=ftp://mirror.planetunix.net/pub/OpenBSD/snapshots/packages/i386
export PS1='[\u@\h \W]\$ '
export WWW_HOME=http://www.google.com/
export PATH=$PATH:/usr/local/jdk-1.7.0/bin/
export JAVA_HOME=/usr/local/jdk-1.7.0
