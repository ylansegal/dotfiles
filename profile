# Customization that is used by all shells (bash, zsh, etc)

# PATH CUSTOMIZATION AND ADDITIONS

PATH=/usr/local/bin:$PATH:~/bin

if [ -d ~/ruby-dev-scripts ]; then
    PATH=$PATH:~/ruby-dev-scripts
fi
HEROKU_PATH="/usr/local/heroku/bin"
NPM_PATH="/usr/local/share/npm/bin"
BREW_SBIN_PATH="/usr/local/sbin"

PATH="$PATH:$BREW_SBIN_PATH:$HEROKU_PATH:$NPM_PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH

#Aliases
alias wsd="cd ~/mellmo-git/web-server"
alias rdd="cd ~/mellmo-git/ruby-gems/roambi/roambi-data/"
alias rid="cd ~/mellmo-git/ruby-gems/roambi/roambi-i18n/"
