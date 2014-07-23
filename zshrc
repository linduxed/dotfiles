#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

toLower() {
  echo $1 | tr "[:upper:]" "[:lower:]"
}

SYSTEM=`uname -s`
SYSTEM=`toLower $SYSTEM`
SHORTHOST=`uname -n`

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Host specific settings
if [ -r "${ZDOTDIR:-$HOME}/.zprezto/host-specific/$SYSTEM" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/host-specific/$SYSTEM"
fi

if [ -r "${ZDOTDIR:-$HOME}/.zprezto/host-specific/$SHORTHOST" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/host-specific/$SHORTHOST"
fi

if [ -r "/etc/zsh/zprofile" ]; then
  source "/etc/zsh/zprofile"
fi
