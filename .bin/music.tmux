#!/bin/bash

spacer="⮃"

if ps ax | grep -q "[m]pd"; then
  now_playing=$(ncmpcpp --now-playing '{%a - %t}')

  if [ "$now_playing" != "" ]; then
    fav_status=""
    if type -p fav.sh > /dev/null; then
      fav.sh has "$now_playing" > /dev/null && fav_status="❤  "
    fi
    echo "#[fg=colour6]⮂#[bg=colour6,fg=colour0] ♫  $now_playing #[fg=colour1]$fav_status#[fg=colour0]⮂"
  else
    echo "$spacer"
  fi
else
  echo "$spacer"
fi

