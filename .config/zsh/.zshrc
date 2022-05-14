source $XDG_CONFIG_HOME/zsh/.env.zsh
source $XDG_CONFIG_HOME/zsh/.funcs.zsh

if [ $USER != "root" ] ; then
   if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
     exec tmux
   fi
fi

setopt append_history # append rather then overwrite
setopt extended_history # save timestamp
setopt inc_append_history # add history immediately after typing a command
setopt BASH_REMATCH

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

### End of Zinit's installer chunk

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit snippet OMZL::completion.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::history.zsh 
zinit snippet OMZL::prompt_info_functions.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice wait"2" lucid; zinit light zsh-users/zsh-completions
zinit ice wait"2" lucid; zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait"2" lucid; zinit snippet OMZP::git
zinit ice wait"2" lucid; zinit snippet OMZP::pip
zinit ice wait"2" lucid; zinit snippet OMZP::python
zinit ice wait"2" lucid; zinit snippet OMZP::tmux
zinit ice wait"2" lucid; zinit light mfaerevaag/wd 
zinit ice wait"2" lucid; zinit load agkozak/zsh-z


# Fast Syntax Highlighting has to load last
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk
#
#
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

## To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
