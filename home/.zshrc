# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tmux="TERM=screen-256color tmux"

#settings for terminal
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
alias rake="bundle exec rake"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby vi-mode yum heroku gem github gpg-agent rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/var/lib/gems/1.8/bin:~/bin:~/.gem/ruby/1.8/bin:/usr/local/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/robsharp/.rvm/bin:/home/robsharp/.gem/ruby/1.8/bin

#AndroidDev PATH 
export PATH=$PATH:$HOME/android-sdk-linux/tools 
export PATH=$PATH:$HOME/android-sdk-linux/platform-tools 

# ruby things
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export USE_BUNDLER=force
