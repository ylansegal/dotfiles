# Customization that is used by all shells (bash, zsh, etc)

# Source all files in profile.d directory
if [ -d ~/.profile.d ]; then
  for filename in ~/.profile.d/*.sh; do
    source $filename
  done
fi

# PATH CUSTOMIZATION AND ADDITIONS
if [ -d ~/.bin ]; then
    PATH=~/.bin:$PATH
fi

if [ -d /usr/local/sbin ]; then
  PATH=/usr/local/sbin:$PATH
fi

if [ -d ~/.yarn/bin ]; then
  PATH=~/.yarn/bin:$PATH
fi

if [ -d ~/.config/yarn/global/node_modules/.bin ]; then
  PATH=~/.config/yarn/global/node_modules/.bin:$PATH
fi

export PATH

# Other environment variables
export ATOM_REPOS_HOME=~/Development
# Apple XCode tools support
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/"
export EDITOR=nano
# Needed by crystal in macOS High Sierra.
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
# Elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
# fzf options
export FZF_DEFAULT_OPTS="--reverse"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# Enable asdf
source "/usr/local/opt/asdf/asdf.sh"

# Source .env when logging in
if [ -f ~/.env ]; then
  habitat
fi
