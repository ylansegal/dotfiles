#!/usr/bin/env bash
# Note-taking shortcuts

ssh() {
  # Set iTerm profile to Ssh
  echo -e "\033]50;SetProfile=Ssh\a"
  if command ssh "$@"; then
    # Set iTerm profile to Default
    echo -e "\033]50;SetProfile=Default\a"
  fi
}
