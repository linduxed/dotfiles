linduxed's dotfiles
===================

This repo houses almost everything I need to have one of my systems configured to my liking.

The files are managed by [chezmoi](https://www.chezmoi.io/).

Installation
------------

Install `chezmoi`, then initialize and apply:

```sh
chezmoi init --apply https://github.com/linduxed/dotfiles.git
```

If you prefer to review first:

```sh
chezmoi init https://github.com/linduxed/dotfiles.git
chezmoi diff
chezmoi apply
```

Host-specific and OS-specific behavior
--------------------------------------

- `chezmoi` data defaults in `.chezmoidata.yaml`. Host-local overrides should be placed in `~/.config/chezmoi/chezmoi.toml`.
- OS/host dispatch is handled through templates and `.chezmoiignore.tmpl`.
