# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Sets the directory where my oh-my-zsh customizations go:
ZSH_CUSTOM="$HOME/.dotfiles/zsh_custom"
ZSH_THEME="ylansegal"
export ZSH_CUSTOM ZSH_THEME

# Example aliases
alias git='nocorrect git'

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
plugins=(bundler)

source $ZSH/oh-my-zsh.sh

# Report if commands take longer than x seconds:
REPORTTIME=5

# Syntax Highlighting
# Installed with: brew install zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------
# ^S for fuzzy matching files under current directory
# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol
# Run fuzz in the current working directory, appending the selected path, if
# any, to the current command.
function insert-fuzzy-path-in-command-line() {
    local selected_path
    # Print a newline or we'll clobber the old prompt.
    echo
    # Find the path; abort if the user doesn't select anything.
    selected_path=$(fd | fzf --multi | xargs echo) || return
    # Append the selection to the current command buffer.
    eval 'LBUFFER="$LBUFFER$selected_path"'
    # Redraw the prompt since Selecta has drawn several new lines of text.
    zle reset-prompt
}
# Create the zle widget
zle -N insert-fuzzy-path-in-command-line
# Bind the key to the newly created widget
bindkey "^s" "insert-fuzzy-path-in-command-line"
# ----------------------

# ----------------------
# ^b for fuzzy matching git branches
# Run fuzz in the current working directory, appending the selected path, if
# any, to the current command.
function insert-fuzzy-git-branch-in-command-line() {
    local selected_path
    echo
    selected_path=$(git for-each-ref refs/heads | cut -d/ -f3- | fzf) || return
    eval 'LBUFFER="$LBUFFER$selected_path"'
    zle reset-prompt
}
# Create the zle widget
zle -N insert-fuzzy-git-branch-in-command-line
# Bind the key to the newly created widget
bindkey "^b" "insert-fuzzy-git-branch-in-command-line"
# ----------------------

# ----------------------
# ^g for fuzzy matching git files
function insert-fuzzy-git-files-in-command-line() {
    local selected_path
    echo
    selected_path=$(git status --porcelain | fzf --multi | sed s/^...// | xargs echo) || return
    eval 'LBUFFER="$LBUFFER$selected_path"'
    zle reset-prompt
}
# Create the zle widget
zle -N insert-fuzzy-git-files-in-command-line
# Bind the key to the newly created widget
bindkey "^g" "insert-fuzzy-git-files-in-command-line"
# ----------------------

# ----------------------
# ^k for fuzzy matching git commits
function insert-fuzzy-git-commits-in-command-line() {
    local selected_path
    echo
    selected_path=$(git log --oneline --max-count=1000 | fzf | cut -d ' ' -f1) || return
    eval 'LBUFFER="$LBUFFER$selected_path"'
    zle reset-prompt
}
# Create the zle widget
zle -N insert-fuzzy-git-commits-in-command-line
# Bind the key to the newly created widget
bindkey "^k" "insert-fuzzy-git-commits-in-command-line"
# ----------------------

# Tig autocompletion
if [ -f /usr/local/etc/bash_completion.d/tig-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/tig-completion.bash
fi

# Enable zmv
autoload -U zmv

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
