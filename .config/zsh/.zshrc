# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

#export DUB_HOME="/home/emdash00/.dub/packages"

#export PATH=$DUB_HOME/dcd-0.12.0/dcd/bin/:$DUB_HOME/dfix-0.3.5/dfix:$DUB_HOME/dfmt-0.11.0/dfmt/bin:$DUB_HOME/dscanner-0.8.0/dscanner/bin:$PATH


#export PATH="$PATH:$HOME/Apps/git-apps/skim/bin"
#export PYTHONPATH="${PYTHONPATH}:/home/emdash00/Documents/Work/Rothlab/lib/SILKOWRM"
#export APPS="$HOME/Apps"

#export XDG_CONFIG_HOME='/home/emdash00/.config'
#export XDG_DATA_HOME='/home/emdash00/.local/share'
#export LD_LIBRARY_PATH='/usr/local/lib'
#export PROBUDS='D0:FB:E1:F6:A5:12'

alias todo="todo.sh"
alias ssh="ssh $SSH_CONFIG $SSH_ID "
alias ssh-copy-id="ssh-copy-id $SSH_ID"

export TERM="xterm-256color"
export VIMINIT='if !has("nvim") 
                  let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC 
               else
                  let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim" | source $MYVIMRC
               endif'
               

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
export ZSH_CUSTOM=/home/emdash00/.config/oh-my-zsh/custom
export ZSH_CACHE_DIR=/home/emdash00/.config/oh-my-zsh/cache

export HISTFILE="$XDG_CACHE_HOME/zsh_history"

export PROBUDS='D0:FB:E1:F6:A5:12'

export NOVINT_DEVICE_SUPPORT="/usr/local/"


export REF="$HOME/Documents/Notes"
export LIB="$HOME/Documents/Library"
export RL="$HOME/Documents/Work/Rothlab"

export WORKON_HOME=$HOME/.virtualenvs   # Optional
export PROJECT_HOME=$HOME/projects      # Optional



export HISTSIZE=1000
export SAVEHIST=10000

setopt append_history # append rather then overwrite
setopt extended_history # save timestamp
setopt inc_append_history # add history immediately after typing a command


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-fontconfig"


POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=1

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰───⎸"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir_writable dir virtualenv vi_mode  newline todo vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history command_execution_time time)

#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_SHORTEN_DELIMITER=".."
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_TIME_FOREGROUND='cornmilk1'
POWERLEVEL9K_TIME_BACKGROUND='grey3'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='grey62'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOSTART_ONCE=false

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	tmux
	vi-mode
	pep8
	pip
	python
	wd
	z
)

source $ZSH/oh-my-zsh.sh
source ~/Apps/git-apps/todo.txt-cli/todo_completion


# export MANPATH="/usr/local/man:$MANPATH"

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
   export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

autoload -Uz compinit
compinit

source ~/.fonts/*.sh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi


alias gwd='pwd | head -c -1 | xclip -selection clipboard'
alias clip='xclip -selection clipboard'
alias reload='source $XDG_CONFIG_HOME/zsh/.zshrc'

alias tconf='nvim /home/emdash00/.config/termite/config'
alias zconf='nvim /home/emdash00/.config/zsh/.zshrc'
alias nconf='nvim /home/emdash00/.config/nvim/' 
alias iconf='nvim /home/emdash00/.config/i3/config'
alias standby='systemctl suspend'
alias rm='rm --preserve-root -I'

git() {
   if [[ $@ == "ls" ]] ; then
      command ls --group-directories-first --color=auto \
              -d $(git ls-tree $(git branch | grep \* | cut -d " " -f2) --name-only)
   elif [[ $@ == "ls -p" ]]; then
       command ls -p --group-directories-first --color=auto \
              -d $(git ls-tree $(git branch | grep \* | cut -d " " -f2) --name-only)
   else
       command git "$@"
   fi
}

source /home/emdash00/.local/bin/virtualenvwrapper.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

