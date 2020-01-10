#!/usr/bin/env bash

today() {
  local notes_home=${NOTES_HOME:-$HOME/Personal/Notes}
  cd $notes_home || return

  target_note="DailyLog/$(date '+%Y-%m-%d').md"
  if [ ! -f $target_note ]; then
    last_note=$(find DailyLog | sort | tail -n 1)
    # Removed completed tasks
    grep -v "\- \[[xX]\]" $last_note | \
      # Remove anything after "---" so it doesn't carry over to the note
      awk 'NR == 1 { output = 1 }; /---/ { output = 0 }; output { print }' \
      > $target_note
  fi

  local editor=${NOTES_EDITOR:-atom}
  $editor . $target_note
  cd - || return
}
