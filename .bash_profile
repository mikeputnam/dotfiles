#https://gist.github.com/henrik/31631
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

alias asdf='git status'
alias ls='ls -la --color'

export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export PS1='\u@\h \[\033[1;33m\]\W\[\033[0m\]$(parse_git_branch)\$ '

if uname | grep 'CYGWIN'>/dev/null 2>&1; then
    alias knife='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/knife'
    alias chef-client='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/chef-client'
    alias chef-solo='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/chef-solo'
    alias shef='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/shef'
fi

#https://gist.github.com/rbriank/2578640
# Start/Reuse SSH Agent - restart or re-use an existing agent
SSH_AGENT_CACHE=/tmp/ssh_agent_eval_`whoami`
if [ -s "${SSH_AGENT_CACHE}" ]
then
  echo "Reusing existing ssh-agent"
  eval `cat "${SSH_AGENT_CACHE}"`

  # Check that agent still exists
  kill -0 "${SSH_AGENT_PID}">/dev/null 2>&1

  if [ $? -eq 1 ]
    then
    echo "ssh-agent pid ${SSH_AGENT_PID} no longer running"
    # Looks like the SSH-Agent has died, it'll be restarted below
    rm -f "${SSH_AGENT_CACHE}"
  fi
fi

if [ ! -f "${SSH_AGENT_CACHE}" ]
then
  echo "Starting new ssh-agent"
  touch "${SSH_AGENT_CACHE}"
  chmod 600 "${SSH_AGENT_CACHE}"
  ssh-agent >> "${SSH_AGENT_CACHE}"
  chmod 400 "${SSH_AGENT_CACHE}"
  eval `cat "${SSH_AGENT_CACHE}"`

  # your own private key
  ssh-add ~/.ssh/id_rsa
fi 

