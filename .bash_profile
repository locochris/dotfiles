alias ll='ls -Gal'
alias l='ll'
alias be='bundle exec'

alias git-sub-pull='git pull --rebase && git submodule sync && git submodule update -i --recursive'
function git-sub-rm
{
  git rm --cached $1
  git config -f .git/config --remove-section submodule.$1
  git config -f .gitmodules --remove-section submodule.$1
  rm -rf $1
}

function git-resolve
{
  vim `git st -s | grep ^UU | awk '{ print $2 }'`
}

function source_recursively
{
  for i in $1/*; do
    if [ -d $i ]; then
      source_recursively $i
    else
      source $i
    fi
  done
}

source_recursively "$HOME/.bash"

p() {
    cd /projects/`ls /projects | grep $1 | head -1`
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*
export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/node/bin:$PATH

export EDITOR=vim
export TERM=xterm-256color
complete -cf sudo

# Platform-specific bits
if [ `uname` == "Linux" ]; then
  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
elif [ `uname` == "Darwin" ]; then
  alias mvim="open -a MacVim $1"
fi


# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
