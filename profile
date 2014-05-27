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

# Other environment variableval
ATOM_REPOS_HOME=~/Development
export ATOM_REPOS_HOME

#Aliases
alias pandora="pianobar"
alias subl="atom"

# Functions

function mercy_kill() {
  pid=$1
  for signal in TERM INT HUP KILL; do
    cmd="kill -s ${signal} $pid"
    echo $cmd
    eval $cmd
    for i in {0..19}; do
      if [ $(ps -p $pid|wc -l) -lt 2 ]; then
        echo "pid $pid no longer exists"
        return 0
      fi
      sleep 0.1
    done
  done
}

cdp() {
    cd $(find ~/mellmo-git ~/mellmo-git/ruby-gems/roambi ~/Development ~/Personal -maxdepth 1 -type d | selecta)
}
