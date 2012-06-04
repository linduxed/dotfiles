GNU Screen
==========

Defines [GNU Screen][1] aliases and provides for auto launching it at start-up.

Aliases
-------

  - `sl` lists sessions/socket directory.
  - `sn` starts a new session.
  - `sr` attaches to a session if one exists or start a new one.

Settings
--------

### Auto-start

Starts a GNU Screen session automatically when Zsh is launched.

To enable this feature, add the following line to *zshrc*:

    zstyle ':omz:module:screen' auto-start 'yes'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.gnu.org/software/screen/
[2]: https://github.com/sorin-ionescu/oh-my-zsh/issues

