#!/usr/bin/env bash
# Changes to a project directory, found fuzzily
cdp() {
    dir=$(find -H ~/Development ~/Personal -maxdepth 1 -type d | fzf)
    if [ ! -z "$dir" ]; then
      cd $dir || return
      habitat
    fi
}
