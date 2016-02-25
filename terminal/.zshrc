# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# source nix
if [[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Customize to your needs...
export TERM="screen-256color"

# NeoVim
export EDITOR="nvim"
export VISUAL="nvim"

# postgrea
export PGDATA="/usr/local/var/postgres"

# homebrew
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# arcanist
export PATH="$HOME/Projects/phacility/arcanist/bin:$PATH"

# cask for emacs
export PATH="$HOME/.cask/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Cask should use global Applications
HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Specify APP_ENV
export APP_ENV=development

# Specify GEM_HOME and GEM_PATH
export GEM_HOME="$HOME/.gem/ruby/2.1.2"
export GEM_PATH="$GEM_HOME"
export PATH="$GEM_HOME/bin:$PATH"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# npm
export PATH="./node/bin:./node_modules/.bin:$PATH"

# pass
export PASSWORD_STORE_DIR="$HOME/.password-store"
export PASSWORD_STORE_GIT="$HOME/.password-store/.git"

# dyld
export DYLD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib/swift/macosx/"
launchctl setenv DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH

# gnupg
export GNUPGHOME="$HOME/.gnupg"

# rebind ctrl-r
bindkey "^R" history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-backward

# Use NeoVim
alias "vim"="$HOME/.nix-profile/bin/nvim"

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

RUBIES+=(
  /nix/store/7y6kfa955yknjjnr33693vkbb8b793xz-ruby-2.1.2-p353
  )
