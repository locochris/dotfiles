#!/bin/sh

favfile="$HOME/Dropbox/Notes/faves.txt"
np=$(ncmpcpp --now-playing '{%a - %t}')

case $1 in
  ls)
    cat $favfile
    ;;
  rm)
    grep -v "$np" $favfile > /tmp/faves && mv /tmp/faves $favfile
    ;;
  has)
    grep "^$2\$" $favfile && exit 0
    exit 1
    ;;
  edit)
    vim "$favfile"
    ;;
  *)
    echo "$np" >> $favfile
    cat $favfile | uniq > /tmp/faves && mv /tmp/faves $favfile
    ;;
esac
