# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH="~/bin:~/.gem/ruby/1.8/bin:/usr/local/bin:/bin$PATH"
export EDITOR=vim

# Set up git tab completion and show branch name in command prompt
source ~/.scripts/git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='\u@\h:\w$(__git_ps1 "[%s]")\$ '

alias tree="tree -C"

if [[ -s ~/.bash_profile.local ]] ; then source ~/.bash_profile.local ; fi
if [[ -s ~/.rvm/scripts/rvm    ]] ; then source ~/.rvm/scripts/rvm    ; fi
