#!/usr/bin/env bash
# Fuzzy find in history and executes
h() {
  pid=$(history | uniq_history | gtac | fzf | awk '{ print $1 }')
  if [ ! -z "$pid" ]; then
    fc -e - $pid
  fi
}
