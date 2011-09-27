case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    cygwin)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=''
        ;;
esac

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

PS2='> '
PS4='+ '

function proml {
  local        BLUE="\[\033[1;34m\]"
  local         RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local       WHITE="\[\033[0;37m\]"
  PS1="${TITLEBAR}\
$BLUE\u|$RED\h$BLUE:\w$GREEN\$(parse_git_branch)$RED $GREEN$ $WHITE"
}
proml
