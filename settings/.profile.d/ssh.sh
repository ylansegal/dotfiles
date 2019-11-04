#!/usr/bin/env bash
# Note-taking shortcuts

ssh() {
  # Set iTerm profile to Ssh
  echo -e "\033]50;SetProfile=Ssh\a"

  # Are we connecting to a procore server?

  if [[ ${@: -1} =~ procore ]]; then
    # Atatch or create a a "main" tmux session, configured for iTerm
    set -x
    command ssh -t "$@" 'tmux -CC new -A -s ylan'
  else
    command ssh "$@"
  fi
  echo -e "\033]50;SetProfile=Default\a"
}
