# Customization that is used by all shells (bash, zsh, etc)

PATH=/usr/local/bin:$PATH:~/bin

if [ -d ~/ruby-dev-scripts ]; then
    PATH=$PATH:~/ruby-dev-scripts
fi

export PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#Aliases
alias wsd="cd ~/mellmo-git/web-server"
alias rdd="cd ~/mellmo-git/ruby-gems/roambi/roambi-data/"
alias rid="cd ~/mellmo-git/ruby-gems/roambi/roambi-i18n/"
