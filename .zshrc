# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# TODO why the fuck does this not re-export PATH?
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/dell/srvadmin/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# safer deleting
alias rm="rm -i"
# shortcut to full ls
alias ll="ls -lh"

# I forget exactly what this did, probably something to do with tmux
# stty -ixon

# julia multithreading
export JULIA_NUM_THREADS=6

export JULIA_BINDIR=/opt/julia/bin

export PATH=$PATH:$JULIA_BINDIR

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JULIA_BINDIR/../lib

# set all editors to nvim
export JULIA_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox

# tmux stuff: not used with i3.  WARNING can break terminal!
# alias tmux to set different term variable
# alias tmux="env TERM=xterm-256color tmux"
# start tmux on terminal start
# [[ $TERM != "screen" ]] && exec tmux

