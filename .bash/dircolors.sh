if [ "$TERM" != "dumb" ] && [ `uname` != "Darwin" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi
