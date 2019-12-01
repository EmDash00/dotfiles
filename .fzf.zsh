# Setup fzf
# ---------
if [[ ! "$PATH" == */home/emdash00/Apps/git-apps/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/emdash00/Apps/git-apps/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/emdash00/Apps/git-apps/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/emdash00/Apps/git-apps/fzf/shell/key-bindings.zsh"
