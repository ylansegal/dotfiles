# Customization that is used by all shells (bash, zsh, etc)

# PATH CUSTOMIZATION AND ADDITIONS

if [ -d ~/mellmo-git/ruby-dev-scripts ]; then
    PATH=$PATH:~/mellmo-git/ruby-dev-scripts
fi

if [ -d ~/Personal/dev-scripts ]; then
    PATH=$PATH:~/Personal/dev-scripts
fi

PATH="/usr/local/sbin:$PATH" # Add sbin, some stuff is installed there by homebrew
export PATH

# Other environment variables
ATOM_REPOS_HOME=~/Development
export ATOM_REPOS_HOME

#Aliases
alias pandora="pianobar"
alias subl="atom"
alias ios_simulator="open /Applications/Xcode.app/Contents/Applications/iOS\ Simulator.app"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
PATH=~/.rbenv/shims:$PATH

# Functions

# Fuzzyness

function better_fzf() {
  fzf --reverse
}

FUZZ_MATCHER=better_fzf
export FUZZ_MATCHER

# Fuzzy find of processes and then kill
function mercy_kill() {
  pid=$(ps | grep -v $FUZZ_MATCHER | $FUZZ_MATCHER | sed "s/^[ \t]*//" |cut -f 1 -d ' ')
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

# Stolen from http://www.smallmeans.com/notes/shell-history/
function histogram() {
  sort | uniq -c | sort -rn | awk '!max{max=$1;}{r="";i=s=60*$1/max;while(i-->0)r=r"#";printf "%15s %5d %s %s",$2,$1,r,"\n";}'
}

# Changes to a project directory, found fuzzily
cdp() {
    cd $(find ~/mellmo-git ~/mellmo-git/ruby-gems/roambi ~/Development ~/Personal -maxdepth 1 -type d | $FUZZ_MATCHER)
}

# Searches for files under the current directory
fuzz() {
  search_term=$1
  find . -wholename \*$search_term\* -not -path './.*/*' | $FUZZ_MATCHER
}

# Fuzzy find in history, does not execute
h() {
  fc -e - $(history | gtac | $FUZZ_MATCHER | sed 's/^[ \t]*//' | cut -f1 -d ' ')
}

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
