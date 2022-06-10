# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
unsetopt auto_name_dirs

if test -d /etc/profile.d/; then
  for profile in /etc/profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done
  unset profile
fi

# ls dircolors configuration (extracted from Prezto)
if is-callable 'dircolors'; then
  # GNU Core Utilities
  if [[ -s "$HOME/.zprezto/dircolors" ]]; then
    eval "$(dircolors --sh "$HOME/.zprezto/dircolors")"
  else
    eval "$(dircolors --sh)"
  fi

  alias ls="${aliases[ls]:-ls} --color=auto"
else
  # BSD Core Utilities
  #
  # Define colors for BSD ls if they're not already defined
  if [[ -z "$LSCOLORS" ]]; then
    export LSCOLORS='exfxcxdxbxGxDxabagacad'
  fi

  # Define colors for the completion system if they're not already defined
  if [[ -z "$LS_COLORS" ]]; then
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
  fi

  alias ls="${aliases[ls]:-ls} -G"
fi

# Configuration from tag-programming.
[ -f "$HOME/.zsh_desktop_alias" ] && source "$HOME/.zsh_desktop_alias"

# Configuration from tag-programming.
[ -f "$HOME/.zsh_programming_env" ] && source "$HOME/.zsh_programming_env"
[ -f "$HOME/.zsh_programming_alias" ] && source "$HOME/.zsh_programming_alias"

# Configuration from tag-todo
[ -f "$HOME/.zsh_todo_alias" ] && source "$HOME/.zsh_todo_alias"

# Configuration from tag-task
[ -f "$HOME/.zsh_task_alias" ] && source "$HOME/.zsh_task_alias"

# Configuration from tag-diary
[ -f "$HOME/.zsh_diary_env" ] && source "$HOME/.zsh_diary_env"

# Note taking aliases.
[ -f "$HOME/.znotes" ] && source "$HOME/.znotes"

# vimwiki aliases
[ -f "$HOME/.zsh_vimwiki" ] && source "$HOME/.zsh_vimwiki"

# Host-specific configuration loaded after aliases for overriding.
source "$HOME/.zsh_alias"
source "$HOME/.zsh_host-specific"
