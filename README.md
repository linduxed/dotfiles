linduxed's dotfiles
===================

This repo houses almost everything I need to have one of my systems configured to my liking.
There's all kinds of stuff in here and some things might not be used anymore, but I try to clean things up from time to time.

I use [rcm](https://github.com/thoughtbot/rcm) to organize my dotfiles.

Installation
------------

Make sure that you've got **rcm** installed, then clone this repository:
```
git clone --recursive https://github.com/linduxed/dotfiles.git ~/.dotfiles
```
Before you run `rcup`, I'd recommend you backup any dotfiles you'd like to keep.
You'll have to check on your system what files could be overwritten.

To get all the files in place, just run `RCRC=~/.dotfiles/rcrc rcup`.
You can skip prepending the `RCRC` variable if you place a symlink from `~/.rcrc` to `~/.dotfiles/rcrc`, prior to running `rcup`.
