#!/bin/bash

spacer="⮃"

if ps ax | grep -q "[m]pd"; then
  now_playing=$(ncmpcpp --now-playing '{%a - %t}')

  if [ "$now_playing" != "" ]; then
    echo "#[fg=colour6]⮂#[bg=colour6,fg=colour0] ♫  $now_playing #[fg=colour0]⮂"
  else
    echo "$spacer"
  fi
else
  echo "$spacer"
fi

