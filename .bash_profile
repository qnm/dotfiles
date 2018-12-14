. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias vim='nvim'

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
