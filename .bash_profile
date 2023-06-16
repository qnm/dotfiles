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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/qnm/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/qnm/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/qnm/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/qnm/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
