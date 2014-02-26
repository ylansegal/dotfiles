#. "$HOME/.bashrc"

#Ylan's Profile
PATH=/usr/local/bin:$PATH:~/bin

#COLORS!
#ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#prompt colors
export PS1='\[\e[1;32m\]\u@\h \W\$\[\e[0m\] '

#Aliases
#alias brake="bundle exec rake"
alias flush_dns_cache="dscacheutil -flushcache"

# Store 10000 commands in bash history
export HISTFILESIZE=10000
export HISTSIZE=10000
# Don't put duplicate lines in the history
export HISTCONTROL=ignoredups
# Appending bash history
shopt -s histappend
#S Sacing history after each command
PROMPT_COMMAND='history -a'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
