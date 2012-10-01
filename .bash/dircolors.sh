if [ "$TERM" != "dumb" ] && [ `uname` == "Linux" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi
