alias todo="todo.sh"
alias ssh="ssh $SSH_CONFIG $SSH_ID "
alias ssh-copy-id="ssh-copy-id $SSH_ID"

alias gwd='pwd | head -c -1 | xclip -selection clipboard'
alias clip='xclip -selection clipboard'
alias reload='source $XDG_CONFIG_HOME/zsh/.zshrc'
alias tconf='nvim /home/emdash00/.config/termite/config'
alias zconf='nvim /home/emdash00/.config/zsh/.zshrc'
alias nconf='nvim /home/emdash00/.config/nvim/' 
alias iconf='nvim /home/emdash00/.config/i3/config'
alias standby='i3lock-fancy && systemctl suspend'
alias lock='i3lock-fancy'
alias hibernate='i3lock-fancy && systemctl hibernate'
alias rm='rm --preserve-root -I'
alias feed='flatpak run org.gnome.FeedReader' 
alias feedstop='flatpak kill org.gnome.FeedReader'
alias grep='grep -P --color=auto'

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

SSH_ENV="$HOME/.ssh/environment"
start_agent() {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

source $APPS/git-apps/todo.txt-cli/todo_completion
source ~/.local/bin/virtualenvwrapper.sh
[[ $- == *i* ]] && source "$APPS/git-apps/skim/shell/completion.zsh" 2> /dev/null
source "$APPS/git-apps/skim/shell/key-bindings.zsh"
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

declare -f path_append > /dev/null 
if [ $? -eq 1 ] ; then
   path_append()
   {
      if [ "$#" -eq 0 ]; then
         echo "usage: path_append DIR1 DIR2 DIR3"
         return 1
      else
         for arg in "$@"; do
            if [ -d "${arg:+$arg/}" ] ; then
               if [[ ! ${PATH} =~ ${arg} ]] ; then
                  PATH="${PATH}:${arg}" 
               fi
            else
               echo "Path $arg does not exist. Skipping..."
            fi
         done
      fi
   }
fi

#if command -v pyenv 1>/dev/null 2>&1; then  
   #eval "$(pyenv init -)" 
#fi
#
#

# performs a patched eval so that PATH exports become path_appends.
patched_eval() {
   ex1="export PATH\=\"([[:print:]]+):\\\$\{?PATH\}?\""
   ex2="export PATH\=\"\\\$\{?PATH\}?:([[:print:]]+)\""

   if [[ $1 =~ $ex1 ]] ; then
      local thing=${1//\{PATH\}/PATH}
      local thing=${thing//PATH\"\;/PATH\"}
      local thing=${thing//"export PATH=\"${BASH_REMATCH[2]}:\$PATH\""}

      local dirs="${BASH_REMATCH[2]}"
      local arrIN=(${dirs//:/ })
      for dir in "${arrIN[@]}"
      do
         eval "path_append $dir"
      done

      eval $thing
   elif [[ $1 =~ $ex2 ]] ; then
      local thing=${1//\{PATH\}/PATH}
      local thing=${thing//PATH\"\;/PATH\"}
      local thing=${thing//"export PATH=\"\$PATH\:${BASH_REMATCH[2]}\""}

      local dirs="${BASH_REMATCH[2]}"
      arrIN=(${dirs//:/ })
      for dir in "${arrIN[@]}"
      do
         eval "path_append $dir"
      done

      eval $thing
   else
      eval $1
   fi
}

mk_sympytex() {
   `cp $HOME/Apps/git-apps/SympyTeX/sympytex.sty .`
   `cp $HOME/Apps/git-apps/SympyTeX/sympytex.py .`
}

mkhotspot() {
   command nmcli device wifi hotspot con-name hotspot ssid "Emmy's Ubuntu Hotspot" \
      band bg password $@
}

sympytex() {
   command pplatex $@
   if [ "$?" -eq 0 ]; then
      for i in $@; do :; done
      command python3 "${i/%.tex}.sympy"
      command pdflatex $@ 
   fi
}

if [ $USER != "root" ]; then
   patched_eval "$(pyenv init -)"
   patched_eval "$(pyenv virtualenv-init -)"
   patched_eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
