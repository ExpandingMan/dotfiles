# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# safer deleting
alias rm="rm -i"
# shortcut to full ls
alias ll="ls -lh"

# julia multithreading
export JULIA_NUM_THREADS=6

export JULIA_BINDIR=/opt/julia/bin

export PATH=$PATH:$JULIA_BINDIR

export PATH=$HOME/sbin:$PATH

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

# some host machines may not recognize TERM=alacritty
alias ssh="TERM=xterm-256color ssh"
