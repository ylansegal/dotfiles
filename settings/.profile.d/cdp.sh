#!/usr/bin/env bash
# Changes to a project directory, found fuzzily
cdp() {
    dir=$(fd . --max-depth=1 --type d --type l ~/Development ~/Personal | fzf)
    if [ ! -z "$dir" ]; then
      cd $dir || return
    fi
}
