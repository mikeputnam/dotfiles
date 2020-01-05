# WHERE POSSIBLE:
# Changes made to .kshrc  should be mirrored in .bashrc.
# Changes made to .bashrc should be mirrored in .kshrc.

#https://gist.github.com/henrik/31631
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function man() {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
    LESS_TERMCAP_md=$'\e'"[1;31m" \
    LESS_TERMCAP_me=$'\e'"[0m" \
    LESS_TERMCAP_se=$'\e'"[0m" \
    LESS_TERMCAP_so=$'\e'"[1;44;33m" \
    LESS_TERMCAP_ue=$'\e'"[0m" \
    LESS_TERMCAP_us=$'\e'"[1;32m" \
    command man "$@"
}

# append to the history file, don't overwrite it
shopt -s histappend

export ANSIBLE_NOCOWS=1
export CLICOLOR=1
export HISTCONTROL=ignoreboth
export HISTFILESIZE=100000
export HISTSIZE=100000
export PS1='\u@\h \[\033[1;33m\]\W\[\033[0m\]$(parse_git_branch)\$ '
export SRC=$HOME/src

alias asdf='git status'
alias less='less -R'
alias ls='/bin/ls -la'
alias ll='/bin/ls -l'
alias qwer='git branch -v'

# Extra stuff that doesn't need to be committed with dotfiles
. $HOME/.bashrc_extra
