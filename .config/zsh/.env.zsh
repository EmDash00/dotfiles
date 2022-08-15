export VIMINIT='if !has("nvim") 
   let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC 
else
   let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim" | source $MYVIMRC 
endif'

export TERM="xterm-256color"

# Command history config               
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export HISTSIZE=1000
export SAVEHIST=10000

# Path to your oh-my-zsh installation.
export ZSH="$HOME/plugins"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_CACHE_DIR="$ZSH/cache"

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
   export EDITOR='nvim'
fi

#---------------------------------------------------

export NOVINT_DEVICE_SUPPORT="/usr/local/"
export EIGEN3_ROOT_DIR="/usr/local/include/eigen3/"
export SOFA_INSTALL_DIR="/home/emdash00/Apps/git-apps/sofa/src/"

#---------------------------------------------------

export REF="~/Documents/Notes"
export LIB="~/Documents/Library"
export RL="~/Documents/Work/Rothlab"

export REG_LOC="^(\~|(?:\$\w+)?\.{0,2}\/)([\.\/\w]+)?"

export WORKON_HOME="~/.virtualenvs"   # Optional
export PROJECT_HOME="~/projects"      # Optional
