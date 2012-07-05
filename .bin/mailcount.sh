#!/bin/sh

maildirs="$HOME/Mail/*/INBOX/new/"
ml="$(find $maildirs -type f | wc -l)"
if [ $ml == 0 ]; then
  echo "0"
else
  echo -en "\x03$ml\x01"
fi
