# Customization that is used by all shells (bash, zsh, etc)

# PATH CUSTOMIZATION AND ADDITIONS

PATH=/usr/local/bin:$PATH:~/bin

if [ -d ~/mellmo-git/ruby-dev-scripts ]; then
    PATH=$PATH:~/mellmo-git/ruby-dev-scripts
fi

if [ -d ~/Personal/dev-scripts ]; then
    PATH=$PATH:~/Personal/dev-scripts
fi
BREW_SBIN_PATH="/usr/local/sbin"

PATH="$PATH:$BREW_SBIN_PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH

# Other environment variables
ATOM_REPOS_HOME=~/Development
export ATOM_REPOS_HOME

#Aliases
alias pandora="pianobar"
alias subl="atom"
alias ios_simulator="/Applications/Xcode.app/Contents/Applications/iOS Simulator.app"

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

# Stolen from http://www.smallmeans.com/notes/shell-history/
function histogram() {
  sort | uniq -c| sort -rn | awk '!max{max=$1;}{r="";i=s=60*$1/max;while(i-->0)r=r"#";printf "%15s %5d %s %s",$2,$1,r,"\n";}'
}

cdp() {
    cd $(find ~/mellmo-git ~/mellmo-git/ruby-gems/roambi ~/Development ~/Personal -maxdepth 1 -type d | percol)
}

fuzz() {
  search_term=$1
  find . -wholename \*$search_term\* -not -path './.git/*' | percol
}

fuzzedit()  {
  $EDITOR $(fuzz $1)
}
