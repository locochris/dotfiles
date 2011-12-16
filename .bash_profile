alias git-sub-pull='git pull --rebase && git submodule sync && git submodule update -i --recursive' 
alias ll='ls -Gal'

BASH_EXTRAS_DIR=~/.bash

for i in $BASH_EXTRAS_DIR/*.sh; do
  source $i
done

source ~/.bash/prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/node/bin:$PATH

complete -cf sudo