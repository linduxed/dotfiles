# Path to your oh-my-zsh configuration.
OMZ=$HOME/.oh-my-zsh

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:terminal' auto-title 'yes'

# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:prompt' theme 'linduxed'

autoload -U zmv

toLower() {
  echo $1 | tr "[:upper:]" "[:lower:]" 
}

# Host specific imports
SYSTEM=`uname -s`
SYSTEM=`toLower $SYSTEM`
SHORTHOST=`hostname -s`

if [ -r "$OMZ/host-specific/$SYSTEM" ]; then
	source "$OMZ/host-specific/$SYSTEM"
fi

if [ -r "$OMZ/host-specific/$SHORTHOST" ]; then
	source "$OMZ/host-specific/$SHORTHOST"
fi

# Set the plugins to load (see $OMZ/plugins/).
case $SHORTHOST in
	freke)
		zstyle ':omz:load' plugin 'archive' 'git' 'dpkg' 'tmux'
		;;
	korp)
		zstyle ':omz:load' plugin 'archive' 'git' 'bundler' 'pacman' 'gnu-utils' 'rails' 'rsync' 'z'
		;;
	munin)
		zstyle ':omz:load' plugin 'archive' 'git' 'pacman'
		;;
	*)
		;;
esac

# Load the OH-MY-ZSH settings.
source "$OMZ/init.zsh"
