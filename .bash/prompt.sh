BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
RED="\[\033[1;31m\]"
RESET="\[\033[0;m\]"

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

function git_dirty {
  local git_status="`git status -unormal 2>&1`"
  if [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    echo "○"
  elif [[ "$git_status" =~ nothing\ to\ commit ]]; then
    echo "○"
  else
    echo "±"
  fi
}

function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ on \1/"
}

function rvm_prompt_cmd {
  if [ -x "/usr/local/rvm/bin/rvm-prompt" ]; then
    echo `/usr/local/rvm/bin/rvm-prompt`
  elif [ -x "$HOME/.rvm/bin/rvm-prompt" ]; then
    echo `$HOME/.rvm/bin/rvm-prompt`
  else
    return 1
  fi
}

function ruby_indicator {
  rvm_prompt_cmd > /dev/null && echo ◊
}

function ruby_prompt {
  rvm_prompt_cmd > /dev/null && echo `rvm_prompt_cmd | sed 's/ruby-//'`
}

PS2='> '
PS4='+ '

#export PS1="${TITLEBAR}\n$BLUE\u$RESET at $RED\h$RESET in $BLUE\W$RESET with $RED\$(ruby_indicator) $RESET\$(ruby_prompt)\
#$GREEN\$(git_branch)\n $GREEN\$(git_dirty) $RESET"
export PS1="${TITLEBAR}\n$BLUE\u$RESET at $RED\h$RESET in $BLUE\W$GREEN\$(git_branch) $GREEN\$(git_dirty) $RESET"
