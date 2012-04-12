gnu-utility
===========

Provides for the interactive use of GNU utilities on non-GNU systems.

Installing GNU utilities on non-GNU systems in `$PATH` without a prefix, i.e.
`ls` instead of `gls`, is not recommended since scripts that target other
utilities will be broken.

However, for interactive use, prefixed commands can be wrapped in their
non-prefixed counterparts.

Settings
--------

### Prefix

To use a different prefix, add the following to *zshrc*, and replace 'g' with
the desired prefix:

    zstyle ':omz:module:gnu-utility' prefix 'g'

Authors
-------

*The authors of this module should be contacted via the GitHub issue tracker.*

 - [Sorin Ionescu](/sorin-ionescu)

