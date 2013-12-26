. $HOME/.bashrc.load

# Customization that is used by all shells (bash, zsh, etc)

PATH=/usr/local/bin:$PATH:~/bin

if [ -d ~/ruby-dev-scripts ]; then
    PATH=$PATH:~/ruby-dev-scripts
fi

export PATH

#RVM
export CC=gcc-4.2
  [[ -s "/Users/ylansegal/.rvm/scripts/rvm" ]] && source "/Users/ylansegal/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#Aliases
alias wsd="cd ~/mellmo-git/web-server"
alias rdd="cd ~/mellmo-git/ruby-gems/roambi/roambi-data/"
alias rid="cd ~/mellmo-git/ruby-gems/roambi/roambi-i18n/"
