#!/usr/bin/env bash
# Aliases
alias cat="bat --pager='less -R'"
alias tig="tig --show-signature"
alias iso_date="date "+%Y-%m-%d""
alias seeing_is_believing="seeing_is_believing --xmpfilter-style"
alias fuzzy_search="sk --ansi -i -c 'rg --color=always --line-number \"{}\"' | cut -f1 -d:"
alias inflate='ruby -r zlib -e "STDOUT.write Zlib::Inflate.inflate(STDIN.read)"'
alias strip="xargs echo -n"
alias zk_file_to_link="sed -E 's/(.*)(\.md)/[[\1]]/'" # Converts a file name to wiki-style link
