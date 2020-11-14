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
# sk options
export SKIM_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export SKIM_DEFAULT_OPTIONS="--reverse"
# JIRA utilities
export JIRA_TICKET_REGEX='[A-Z]{2,8}-[0-9]{1,5}'
# Zettlekasten Notes
export ZK_HOME=~/Personal/Notes

# Enable asdf
source "/usr/local/opt/asdf/asdf.sh"
