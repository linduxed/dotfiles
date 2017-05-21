# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if test -d /etc/profile.d/; then
  for profile in /etc/profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done
  unset profile
fi

# Configuration from tag-programming.
[ -f "$HOME/.zsh_programming_env" ] && source "$HOME/.zsh_programming_env"
[ -f "$HOME/.zsh_programming_alias" ] && source "$HOME/.zsh_programming_alias"

# Configuration from tag-todo
[ -f "$HOME/.zsh_todo_alias" ] && source "$HOME/.zsh_todo_alias"

# Note taking aliases.
[ -f "$HOME/.znotes" ] && source "$HOME/.znotes"

# Host-specific configuration loaded after aliases for overriding.
source "$HOME/.zsh_alias"
source "$HOME/.zsh_host-specific"
