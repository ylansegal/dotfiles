# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ylansegal"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rpry="rails-console-pry -r pry-doc -r awesome_print"
alias h\?="history | grep"
alias git='nocorrect git'

# Setting up environement
export EDITOR=subl

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler git-flow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
. ~/.profile

if [ -f ~/.dev.profile ]
then
    . ~/.dev.profile
fi

# Overriding cd function. Looking for .env and sourcing it if found
function cd {
    builtin cd "$@"
  if [[ -f .env ]]; then
    echo "### Setting up environment variables from .env"
    cat .env | grep -v '#' | grep -v '^$' | while read line; do
      echo $line
      export $line
    done
  fi
}

# Report if commands take longer than x seconds:
REPORTTIME=5

## Add empty line before command
PS1=$'\n'"$PS1"

# Syntax Highlighting
# Installed with: brew install zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
