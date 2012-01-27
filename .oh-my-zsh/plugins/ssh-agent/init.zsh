#
# INSTRUCTIONS
#
#   To enabled agent forwarding support, add the following to
#   your .zshrc file:
#
#     zstyle ':omz:plugin:ssh-agent' forwarding 'on'
#
#   To load multiple identies, use the identities style, For
#   example:
#
#     zstyle ':omz:plugin:ssh-agent' identities 'id_rsa' 'id_rsa2' 'id_github'
#
#
# CREDITS
#
#   Based on code from Joseph M. Reagle
#   http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html
#
#   Agent forwarding support based on ideas from
#   Florent Thoumie and Jonas Pfenniger
#

_ssh_agent_env="$HOME/.ssh/environment-$HOST"
_ssh_agent_forwarding=

function _ssh-agent-start() {
  local -a identities

  # Start ssh-agent and setup environment.
  /usr/bin/env ssh-agent | sed 's/^print/#print/' > "${_ssh_agent_env}"
  chmod 600 "${_ssh_agent_env}"
  source "${_ssh_agent_env}" > /dev/null

  # Load identies.
  zstyle -a ':omz:plugin:ssh-agent' identities 'identities'
  print starting...
  /usr/bin/ssh-add "$HOME/.ssh/${^identities}"
}

# Test if agent-forwarding is enabled.
zstyle -b ':omz:plugin:ssh-agent' forwarding '_ssh_agent_forwarding'
if is-true "${_ssh_agent_forwarding}" && [[ -n "$SSH_AUTH_SOCK" ]]; then
  # Add a nifty symlink for screen/tmux if agent forwarding.
  [[ -L "$SSH_AUTH_SOCK" ]] || ln -sf "$SSH_AUTH_SOCK" /tmp/ssh-agent-$USER-screen
elif [ -f "${_ssh_agent_env}" ]; then
  # Source SSH settings, if applicable.
  source "${_ssh_agent_env}" > /dev/null
  ps -ef | grep "${SSH_AGENT_PID}" | grep ssh-agent$ > /dev/null || {
    _ssh-agent-start;
  }
else
  _ssh-agent-start;
fi

# Tidy up after ourselves.
unfunction _ssh-agent-start
unset _ssh_agent_forwarding
unset _ssh_agent_env

