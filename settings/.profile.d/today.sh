#!/usr/bin/env bash

today() {
  cd $HOME/Personal/Notes || return
  target_note="DailyLog/$(date '+%Y-%m-%d').md"
  if [ ! -f $target_note ]; then
    last_note=$(find DailyLog | sort | tail -n 1)
    # Removed completed tasks
    grep -v "\- \[[xX]\]" $last_note | \
      # Remove anything after "---" so it doesn't carry over to the note
      awk 'NR == 1 { output = 1 }; /---/ { output = 0 }; output { print }' \
      > $target_note
  fi
  atom . $target_note
  cd - || return
}
