# WHERE POSSIBLE:
# Changes made to .kshrc  should be mirrored in .bashrc.
# Changes made to .bashrc should be mirrored in .kshrc.

#https://gist.github.com/henrik/31631
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

alias asdf='git status'
alias less='less -R'
alias ls='ls -la'
alias qwer='git branch -a'
alias sw='while true; do echo -ne "\r`date +%H:%M:%S`"; done'

export ANSIBLE_NOCOWS=1
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export HISTSIZE=10000
export HISTFILESIZE=10000
export PS1='\u@\h \[\033[1;33m\]\W\[\033[0m\]$(parse_git_branch)\$ '

# Extra stuff that doesn't need to be committed with dotfiles
. $HOME/.bashrc_extra
