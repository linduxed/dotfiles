#!/bin/sh

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Fix for Xorg's disabling of CAB.
setxkbmap -option terminate:ctrl_alt_bksp &

# Enables repeat for the CapsLock button (Colemak Backspace).
xset r 66 &

# Xdefaults gets loaded.
xrdb -load ~/.Xdefaults &

# Synchronize X clipboard and X selection.
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Autostart
wicd-gtk -t &
gnome-keyring-daemon &
# thunderbird &
# firefox &
xscreensaver -no-splash &
start-pulseaudio-x11 &
dropboxd &
wmname LG3D &
batti &
kupfer &
/usr/lib/gnome-settings-daemon/gnome-settings-daemon &
 
# UIM related
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS=@im='uim'
uim-toolbar-gtk-systray &

exec dbus-launch awesome
# exec gnome-session
