alias git-sub-pull='git pull --rebase && git submodule sync && git submodule update -i --recursive'
alias ll='ls -Gal'
alias be='bundle exec'

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

if [ `uname` == "Linux" ]; then
  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
fi
