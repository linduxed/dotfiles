#
# Configures Ruby gem installation and loads rvm/rbenv.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Install local gems according to Mac OS X conventions.
if [[ "$OSTYPE" == darwin* ]]; then
  export GEM_HOME="$HOME/Library/Ruby/Gems/${$(ruby --version)[6,8]}"
  path=("$GEM_HOME/bin" $path)

  # Set environment variables for launchd processes.
  launchctl setenv GEM_HOME "$GEM_HOME" &!
fi

# Loads RVM into the shell session.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Auto adding variable-stored paths to ~ list conflicts with RVM.
  unsetopt AUTO_NAME_DIRS

  # Source RVM.
  source "$HOME/.rvm/scripts/rvm"
fi

# Loads rbenv into the shell session.
if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=("$HOME/.rbenv/bin" $path)
  eval "$(rbenv init -)"
fi

