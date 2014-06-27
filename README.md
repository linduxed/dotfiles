linduxed's dotfiles
===================

This repo houses almost everything I need to have one of my systems configured to my liking.
There's all kinds of stuff in here and some things might not be used anymore, but I try to clean things up from time to time.

I use [rcm](https://github.com/thoughtbot/rcm) to organize my dotfiles.
I don't yet use the various features rcm provides for setting up host-specific configuration, but some day I'll make an effort to replace my own improvised solutions with those.

Installation
------------

Make sure that you've got **rcm** installed, then clone this repository:
```
git clone --recursive https://github.com/linduxed/dotfiles.git ~/.dotfiles
```
Before you run `rcup`, I'd recommend you backup any dotfiles you'd like to keep.
You'll have to check on your system what files could be overwritten.

Some day maybe I'll add a script which prompts the user whether they want to keep the existing file or replace it with a symlink to the file from my dotfiles.

To get all the files in place, just run `rcup -x README.md` (`-x` excludes a file).
This will take a while, considering it has to symlink *every* file in the entire tree, including the files in the plugins added as submodules.

Cleaning things up
------------------

At the time of writing, rcm has a bug in it which makes it not respect certain settings written in the `rcrc` file.
For instance, when it should just symlink the `vim/bundle`, it ignores that setting and symlinks all the files in all the plugins.
I don't know when it will be fixed, but until that time I recommend doing the following after running a `rcup`:

1. `rm -rf ~/.vim/bundle && ln -s ~/.dotfiles/vim/bundle ~/.vim/bundle`
2. `rm -rf ~/.vim/zprezto && ln -s ~/.dotfiles/zprezto ~/.vim/zprezto`
3. `rm -rf ~/.rbenv && cp -R ~/.dotfiles/rbenv ~/.rbenv`

That should tidy up the dotfiles.

Yes, I'll write a script for this at some point.
I'll also try do get the maintainer of rcm to fix the bug, hopefully making an install script obsolete.
