#!/bin/bash

now_playing=$(ncmpcpp --now-playing '{%a - %t}')
if [ "$now_playing" = "" ]; then
  echo "⮃"
else
  echo "#[fg=colour6]⮂#[bg=colour6,fg=colour0] ♫  $now_playing #[fg=colour0]⮂"
fi
