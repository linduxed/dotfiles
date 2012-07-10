# Path to your oh-my-zsh configuration.
OMZ=$HOME/.oh-my-zsh

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Enable the yaourt frontend for pacman.
zstyle ':omz:module:pacman' frontend 'yaourt'

autoload -U zmv

toLower() {
  echo $1 | tr "[:upper:]" "[:lower:]"
}

SYSTEM=`uname -s`
SYSTEM=`toLower $SYSTEM`
SHORTHOST=`hostname -s`

# Set the plugins to load (see $OMZ/modules/).
case $SHORTHOST in
	freke)
		zstyle ':omz:load' omodule 'archive' 'command-not-found' 'completion' 'directory' 'editor' 'environment' 'dpkg' 'git' 'gnu-utility' 'history' 'prompt' 'ruby' 'spectrum' 'terminal' 'tmux' 'utility' 'rails'
		;;
	hugin)
		zstyle ':omz:load' omodule 'archive' 'command-not-found' 'completion' 'directory' 'editor' 'environment' 'git' 'gnu-utility' 'history' 'pacman' 'prompt' 'rails' 'rsync' 'ruby' 'spectrum' 'terminal' 'utility' 'z'
		;;
	korp)
		zstyle ':omz:load' omodule 'archive' 'command-not-found' 'completion' 'directory' 'editor' 'environment' 'git' 'gnu-utility' 'history' 'pacman' 'prompt' 'rails' 'rsync' 'ruby' 'spectrum' 'terminal' 'utility' 'z'
		;;
	munin)
		zstyle ':omz:load' omodule 'archive' 'command-not-found' 'completion' 'directory' 'editor' 'environment' 'git' 'gnu-utility' 'history' 'pacman' 'prompt' 'rails' 'rsync' 'ruby' 'spectrum' 'terminal' 'utility' 'z'
		;;
	travelmate)
		zstyle ':omz:load' omodule 'archive' 'command-not-found' 'completion' 'directory' 'editor' 'environment' 'git' 'gnu-utility' 'history' 'dpkg' 'prompt' 'rsync' 'spectrum' 'terminal' 'utility'
		;;
	attana-server)
		zstyle ':omz:load' omodule 'archive' 'command-not-found' 'completion' 'directory' 'editor' 'environment' 'dpkg' 'git' 'gnu-utility' 'history' 'prompt' 'spectrum' 'terminal' 'tmux' 'utility'
		;;
	share-01)
		zstyle ':omz:load' omodule 'archive' 'completion' 'directory' 'editor' 'environment' 'dpkg' 'git' 'gnu-utility' 'history' 'prompt' 'spectrum' 'terminal' 'tmux' 'utility'
		;;
	*)
		;;
esac

# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
# Has to be run after loading the modules.
zstyle ':omz:module:prompt' theme 'linduxed'

# Load the OH-MY-ZSH settings.
source "$OMZ/init.zsh"

# Host specific settings
if [ -r "$OMZ/host-specific/$SYSTEM" ]; then
	source "$OMZ/host-specific/$SYSTEM"
fi

if [ -r "$OMZ/host-specific/$SHORTHOST" ]; then
	source "$OMZ/host-specific/$SHORTHOST"
fi
