# Customization that is used by all shells (bash, zsh, etc)

# PATH CUSTOMIZATION AND ADDITIONS
if [ -d ~/.bin ]; then
    PATH=~/.bin:$PATH
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
  pid=$(ps | grep -v fzf | fzf | sed "s/^[ \t]*//" |cut -f 1 -d ' ')
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

# Changes to a project directory, found fuzzily
cdp() {
    dir=$(find -H ~/Development ~/Personal -maxdepth 1 -type d | fzf)
    if [ ! -z "$dir" ]; then
      cd $dir
    fi
    habitat
}

# Searches for files under the current directory
fuzz() {
  fd $1 | fzf
}

# Fuzzy find in history and executes
h() {
  pid=$(history | uniq_history | gtac | fzf | sed 's/^[ \t]*//' | cut -f1 -d ' ')
  if [ ! -z "$pid" ]; then
    fc -e - $pid
  fi
}

# ---------

# Determines current ruby, for prompt
ruby_version()
{
  if which rbenv &> /dev/null; then
    rbenv version | cut -f1 -d ' '
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
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# Source .env when logging in
if [ -f ~/.env ]; then
  habitat
fi

# Note-taking shortcuts
notes() {
  cd ~/Personal/Notes
  atom .
}

today() {
  cd ~/Personal/Notes
  atom DailyLog/`date "+%Y-%m-%d"`.md
  cd -
}

tomorrow() {
  cd ~/Personal/Notes
  atom DailyLog/`date -v+1d "+%Y-%m-%d"`.md
  cd -
}

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
