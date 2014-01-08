if uname | grep 'CYGWIN'; then
    #cygwin specific
    echo "Setting cygwin aliases..."
    alias knife='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/knife'
    alias chef-client='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/chef-client'
    alias chef-solo='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/chef-solo'
    alias shef='/cygdrive/c/opscode/chef/embedded/bin/ruby C:/opscode/chef/bin/shef'
fi

alias gs='git status'
alias ls='ls -la --color'
alias sqlt-diff='PERL5LIB=/home/mike/perl5/lib/perl5 ~/perl5/bin/sqlt-diff'
alias ta='ssh -p 443 mike@dhmn.net'
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
#export PATH=/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Start/Reuse SSH Agent - restart or re-use an existing agent
SSH_AGENT_CACHE=/tmp/ssh_agent_eval_`whoami`
if [ -s "${SSH_AGENT_CACHE}" ]
then
echo "Reusing existing ssh-agent"
eval `cat "${SSH_AGENT_CACHE}"`
# Check that agent still exists
kill -0 "${SSH_AGENT_PID}" 2>-
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
fi 
