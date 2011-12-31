# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="linduxed"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

autoload -U zmv

# Variables
WORDCHARS="${WORDCHARS:s,/,}"

# Exports
export BROWSER=firefox
export EDITOR=vim
# Make the manpages prettier
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Custom colours
if (( $+commands[dircolors] )); then
	eval $(dircolors -b $ZSH/dircolors)
fi

toLower() {
  echo $1 | tr "[:upper:]" "[:lower:]" 
}

# Host specific imports
SYSTEM=`uname -s`
SYSTEM=`toLower $SYSTEM`
SHORTHOST=`hostname -s`

if [ -r "$ZSH/host-specific/$SYSTEM" ]; then
	source "$ZSH/host-specific/$SYSTEM"
fi

if [ -r "$ZSH/host-specific/$SHORTHOST" ]; then
	source "$ZSH/host-specific/$SHORTHOST"
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

case $SHORTHOST in
	freke)
		plugins=(git mercurial svn debian)
		;;
	korp)
		plugins=(git mercurial svn archlinux rails rails3 ruby)
		;;
	munin)
		plugins=(git mercurial svn archlinux)
		;;
	*)
		;;
esac

# Load the OH-MY-ZSH settings.
source $ZSH/oh-my-zsh.sh
