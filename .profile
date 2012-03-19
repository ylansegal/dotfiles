. $HOME/.bashrc.load

# Customization that is used by all shells (bash, zsh, etc)

PATH=/usr/local/bin:$PATH:~/bin
export PATH

# Variables set for better rails performnce (but more memory use)
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

#RVM
export CC=gcc-4.2
  [[ -s "/Users/ylansegal/.rvm/scripts/rvm" ]] && source "/Users/ylansegal/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting