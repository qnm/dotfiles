source /usr/local/opt/asdf/asdf.sh
source /Users/qnm/.asdf/installs/rust/1.31.1/env

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias vim='nvim'

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
