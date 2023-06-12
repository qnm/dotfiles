if [ "$system_type" = "Darwin" ]; then
  source /usr/local/opt/asdf/asdf.sh
  source $HOME/.asdf/installs/rust/1.31.1/env
else
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
  source $HOME/.asdf/installs/rust/1.31.1/env
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GOPATH=$HOME/go
export EDITOR=/usr/bin/nvim

alias vim='nvim'
. "$HOME/.cargo/env"
