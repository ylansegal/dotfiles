#!/usr/bin/env bash
# Note-taking shortcuts

ssh() {
  # Set iTerm profile to Ssh
  echo -e "\033]50;SetProfile=Ssh\a"
  command ssh "$@"
  echo -e "\033]50;SetProfile=Default\a"
}
