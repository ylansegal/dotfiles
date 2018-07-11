# Customization that is used by all shells (bash, zsh, etc)

# PATH CUSTOMIZATION AND ADDITIONS
if [ -d ~/.bin ]; then
    PATH=~/.bin:$PATH
fi

if [ -d ~/Personal/ruby-dev-scripts ]; then
  PATH=~/Personal/ruby-dev-scripts:$PATH
fi

export PATH="/usr/local/sbin:$PATH" # Add sbin, some stuff is installed there by homebrew

# Other environment variables
export ATOM_REPOS_HOME=~/Development
# Apple XCode tools support
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/"
export EDITOR=nano
# Needed by crystal in macOS High Sierra.
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

#Aliases
alias cat="ccat"
alias tig="tig --show-signature"
alias iex="iex --erl '-kernel shell_history enabled'"
alias iso_date="date "+%Y-%m-%d""

# Functions

# Stolen from http://www.smallmeans.com/notes/shell-history/
function histogram() {
  sort | uniq -c | sort -rn | awk '!max{max=$1;}{r="";i=s=60*$1/max;while(i-->0)r=r"#";printf "%15s %5d %s %s",$2,$1,r,"\n";}'
}

function habitat() {
  envfile="${1:-.env}"
  if [[ -f $envfile ]]; then
    echo "### Setting up environment variables from $envfile"
    \cat $envfile | grep -v '#' | grep -v '^$' | grep -v 'PATH'| while read line; do
      echo $line
      export $line
    done
  fi
}

# Fuzzyness
# ---------

# fzf options
export FZF_DEFAULT_OPTS="--reverse"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# Fuzzy find of processes and then kill
function mercy_kill() {
  pid=$(ps | grep -v fzf | fzf | sed "s/^[ \t]*//" | awk '{ print $1 }')
  for signal in TERM INT HUP KILL; do
    cmd="kill -s ${signal} $pid"
    echo $cmd
    eval $cmd
    for _ in {0..19}; do
      if [ "$(ps -p $pid | wc -l)" -lt 2 ]; then
        echo "pid $pid no longer exists"
        return 0
      fi
      sleep 0.1
    done
  done
}

# Changes to a project directory, found fuzzily
cdp() {
    dir=$(find -H ~/Development ~/Personal -maxdepth 1 -type d | fzf)
    if [ ! -z "$dir" ]; then
      cd $dir || return
      habitat
    fi
}

# Searches for files under the current directory
fuzz() {
  fd $1 | fzf
}

# Fuzzy find in history and executes
h() {
  pid=$(history | uniq_history | gtac | fzf | sed 's/^[ \t]*//' | awk '{ print $1 }')
  if [ ! -z "$pid" ]; then
    fc -e - $pid
  fi
}

# ---------

# Determines current ruby, for prompt
ruby_version()
{
  if which rbenv &> /dev/null; then
    rbenv version | awk '{ print $1 }'
  else
    if which rvm-prompt &> /dev/null; then
     rvm-prompt i v g
    fi
  fi
}

# Colorized man pages!
# https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man() {
	env \
		LESS_TERMCAP_mb="$(printf '\e[1;31m')" \
		LESS_TERMCAP_md="$(printf '\e[1;31m')" \
		LESS_TERMCAP_me="$(printf '\e[0m')" \
		LESS_TERMCAP_se="$(printf '\e[0m')" \
		LESS_TERMCAP_so="$(printf '\e[1;44;33m')" \
		LESS_TERMCAP_ue="$(printf '\e[0m')" \
		LESS_TERMCAP_us="$(printf '\e[1;32m')" \
			man "$@"
}

# Note-taking shortcuts
notes() {
  cd ~/Personal/Notes || return
  atom .
}

today() {
  cd ~/Personal/Notes || return
  atom . && atom "DailyLog/$(date '+%Y-%m-%d').md"
  cd - || return
}

tomorrow() {
  cd ~/Personal/Notes || return
  atom "DailyLog/$(date -v+1d '+%Y-%m-%d').md"
  cd - || return
}

# Remind me when command finished

# Adapted from https://dockyard.com/blog/2018/05/11/tell-me-when-it-s-finished
# Usage:
# - with args, `judge mix test`; runs `yay` or `boom`
#   depending on exit status of given command
# - without args, `mix test; judge`; runs `yay` or `boom`
#   depending on exit status of previous command
function remind() {
  last_exit_status=$?
  number_of_args=$#
  if [ $number_of_args -gt 0 ]
  then
    # - treat the args as a command to run
    # - $@ is all the args given
    # - `"$@"` makes sure that quoting is preserved;
    #     eg, if the command was `judge echo one "two three"`,
    #     `echo` will get two args, not three
    # - Once the expansion is done, the shell sees a bare
    #   command and runs it.
    cmnd=$*
    "$@" && _success "$cmnd" || (_failure "$cmnd" && false)
  else
    # No args given means no command to run, so check the exit
    # status of the last command and notify accordingly
    [ $last_exit_status -eq 0 ] && _success || (_failure && false)
  fi
}

function _success() {
  osascript -e "display notification \"$*\" with title \"Command Succeded\" sound name \"Glass\""
}


function _failure() {
  osascript -e "display notification \"$*\" with title \"Command Failed\" sound name \"Funk\""
}


# Source .env when logging in
if [ -f ~/.env ]; then
  habitat
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"
