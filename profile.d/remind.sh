#!/usr/bin/env bash
# Remind me when command finishes

# Adapted from https://dockyard.com/blog/2018/05/11/tell-me-when-it-s-finished
# Usage:
# - with args, `judge mix test`; runs `yay` or `boom`
#   depending on exit status of given command
# - without args, `mix test; judge`; runs `yay` or `boom`
#   depending on exit status of previous command
function remind() {
  last_exit_status=$?
  number_of_args=$#
  if [ $number_of_args -gt 0 ]
  then
    # - treat the args as a command to run
    # - $@ is all the args given
    # - `"$@"` makes sure that quoting is preserved;
    #     eg, if the command was `judge echo one "two three"`,
    #     `echo` will get two args, not three
    # - Once the expansion is done, the shell sees a bare
    #   command and runs it.
    cmnd=$*
    "$@" && _success "$cmnd" || (_failure "$cmnd" && false)
  else
    # No args given means no command to run, so check the exit
    # status of the last command and notify accordingly
    [ $last_exit_status -eq 0 ] && _success || (_failure && false)
  fi
}

function _success() {
  osascript -e "display notification \"$*\" with title \"Command Succeded\" sound name \"Glass\""
}


function _failure() {
  osascript -e "display notification \"$*\" with title \"Command Failed\" sound name \"Funk\""
}
