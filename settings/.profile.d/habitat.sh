#!/usr/bin/env bash
function habitat() {
  envfile="${1:-.env}"
  if [[ -f $envfile ]]; then
    echo "### Setting up environment variables from $envfile"
    \cat $envfile | \
      grep -v '^[#$]' | \
      grep -v 'PATH'| \
      while read line; do
        echo $line
        export ${line?}
      done
  fi
}
