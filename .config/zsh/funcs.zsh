alias todo="todo.sh"
alias ssh="ssh $SSH_CONFIG $SSH_ID "
alias ssh-copy-id="ssh-copy-id $SSH_ID"

alias gwd='pwd | head -c -1 | xclip -selection clipboard'
alias clip='xclip -selection clipboard'
alias gt='gtrash'
alias gtr='gtrash restore'
alias t='gtrash put'
alias lg="lazygit"
alias trash='gtrash put'
alias reload='source $XDG_CONFIG_HOME/zsh/.zshrc'
alias tconf='nvim /home/emdash00/.config/termite/config'
alias zconf='nvim /home/emdash00/.config/zsh/.zshrc'
alias nconf='nvim /home/emdash00/.config/nvim/'
alias iconf='nvim /home/emdash00/.config/i3/config'
alias standby='i3lock-fancy && systemctl suspend'
alias lock='i3lock-fancy'
alias hibernate='i3lock-fancy && systemctl hibernate'
alias rm='rm --preserve-root -I'

declare -A eza_kwargs
eza_kwargs=(
  ["-t"]="generic"   # --time=WORD
  ["-I"]="ignore"    # --ignore-glob=GLOBS
  ["-s"]="generic"   # --sort=SORT_FIELD
  ["-L"]="generic"   # --level=DEPTH
  ["-F"]="generic"   # --classify=WHEN
  ["-w"]="generic"   # -- width=COLS
)


s() {
  local has_all=false
  local has_help=false
  local has_version=false
  local has_dot_hidden=true  # just always hide .hidden
  local has_recurse=false
  local args=()
  local query_dirs=()
  local has_query_dirs=false
  local ignore_globs=""

  local keyword_val="none"

  for arg in "$@"; do
    if [[ $keyword_val != "none" ]]; then
      if [[ $keyword_val == "ignore" ]]; then
        ignore_globs="$arg"
        keyword_val="none"
        continue
      fi

      args+=("$arg")
      keyword_val="none"
      continue
    fi

    if [[ "$arg" != -* ]]; then
      has_query_dirs=true

      if [[ -d "$arg" ]]; then
        query_dirs+=("$arg")
      fi

      args+=("$arg")
      continue
    fi

    if [[ "$arg" == "-a" || "$arg" == "--all" || "$arg" == "-A" || "$arg" == "--almost-all" ]]; then
      has_all=true
    elif [[ "$arg" == '--help' ]]; then
      has_help=true
    elif [[ "$arg" == '-v' || "$arg" == '--version' ]]; then
      has_version=true
    elif [[ "$arg" == '-R' || "$arg" == '--recurse' ]]; then
      has_recurse=true
    elif [[ "$arg" == --ignore-glob=* ]]; then
      ignore_globs="${arg#--ignore-glob=}"
      continue  # don't add --ignore-glob to args
    elif [[ "$arg" == '--dot-hidden' ]]; then
      has_dot_hidden=true
      continue  # don't add --dot-hidden to args
    fi

    keyword_val="${eza_kwargs[$arg]:-none}"

    if [[ $keyword_val == "ignore" ]]; then
      continue
    fi

    args+=("$arg")
  done

  if [[ $has_help == true ]] ; then
    eza --help
    return
  fi

  if [[ $has_version == true ]] ; then
    eza --version
    return
  fi

  if [[ $has_all == true ]] ; then
    has_dot_hidden=false
  fi

  local exclude_files=()
  if [[ $has_dot_hidden == true ]]; then
    if [[ $has_query_dirs == false ]]; then
      query_dirs+=(".")
    fi

    if [[ ${#query_dirs[@]} -gt 0 ]]; then
      local found_files=""
      if [[ $has_recurse == true ]]; then
        found_files=$(find "${query_dirs[@]}" -name '.hidden' -size +0)
      else
        found_files=$(find "${query_dirs[@]}" -maxdepth 1 -name '.hidden' -size +0)""
      fi

      local dot_hidden_files=()
      if [[ -n $found_files ]]; then
        # Convert the output to an array
        dot_hidden_files+=("${(@f)found_files}")
      fi


      if [[ ${#dot_hidden_files[@]} -gt 0 ]]; then
        exclude_files=$(paste -sd '|' "${dot_hidden_files[@]}" | tr '\n' '|' | sed 's/.$/\n/')
      fi
    fi
  fi

  command eza ${args[@]} --icons --group-directories-first -s extension -I "${exclude_files[@]}|$ignore_globs"
}


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

proton_sync() {
  rclone bisync "$HOME/Documents/Proton\ Drive/" "protondrive:/" --verbose --check-access
}

SSH_ENV="$HOME/.ssh/environment"
start_agent() {
    #echo "Initialising new SSH agent..."
    if ! /usr/bin/ssh-agent -t 1800 | sed 's/^echo/#echo/' > "${SSH_ENV}"; then
      echo "Failed to initialize ssh-agent. Command exited with error code $?."
      return 1
    fi
    #echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

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

mkhw() {
   `cp $HOME/Documents/sympytex/templates/hw/hw_template.tex .`
   `cp $HOME/Documents/sympytex/templates/hw/.gitignore .`
}

mkhotspot() {
   command nmcli device wifi hotspot con-name hotspot ssid "Emmy's Ubuntu Hotspot" \
      band bg password $@
}

sympytex() {
   command pplatex $@
   if [ "$?" -eq 0 ]; then
      for i in $@; do :; done
      if [ -f ".venv/bin/python3" ]; then
        command .venv/bin/python3 "${i/%.tex}.sympy"
      else
        echo "Hi"
        command python3 "${i/%.tex}.sympy"
      fi
      if [ "$?" -eq 0 ]; then
         command pdflatex $@
      fi
   fi
}

if [ $USER != "root" ]; then
   patched_eval "$(jenv init -)"
fi

gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}
