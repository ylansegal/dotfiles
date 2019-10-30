#!/usr/bin/env bash
# Note-taking shortcuts

ssh() {
  # Set iTerm profile to Ssh
  echo -e "\033]50;SetProfile=Ssh\a"
  # Atatch or create a a "main" tmux session, configured for iTerm
  command ssh -t "$@" 'tmux -CC new -A -s main'
  echo -e "\033]50;SetProfile=Default\a"
}
