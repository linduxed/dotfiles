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

[ -f "$HOME/.zsh_desktop_alias" ] && source "$HOME/.zsh_desktop_alias"

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

# ls dircolors configuration (extracted from Prezto)
source "$HOME/.zsh_dircolors"

# Host-specific configuration loaded after aliases for overriding.
source "$HOME/.zsh_alias"
source "$HOME/.zsh_host-specific"
