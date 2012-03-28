#
# Sets keyboard bindings.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Dumb terminals lack support.
if [[ "$TERM" == 'dumb' ]]; then
  return
fi

# The default styles.

# Indicator to notify of vi insert mode.
zstyle ':omz:prompt:vi' insert '>>>'

# Indicator to notify of vi command mode.
zstyle ':omz:prompt:vi' command '<<<'

# Indicator to notify of generating completion.
zstyle ':omz:completion' indicator '...'

# Beep on error in line editor.
setopt BEEP

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line

# Use human-friendly identifiers.
zmodload zsh/terminfo
typeset -g -A keyinfo
keyinfo=(
  'Control'   '\C-'
  'Escape'    '\e'
  'Meta'      '\M-'
  'Backspace' "^?"
  'Delete'    "^[[3~"
  'F1'        "$terminfo[kf1]"
  'F2'        "$terminfo[kf2]"
  'F3'        "$terminfo[kf3]"
  'F4'        "$terminfo[kf4]"
  'F5'        "$terminfo[kf5]"
  'F6'        "$terminfo[kf6]"
  'F7'        "$terminfo[kf7]"
  'F8'        "$terminfo[kf8]"
  'F9'        "$terminfo[kf9]"
  'F10'       "$terminfo[kf10]"
  'F11'       "$terminfo[kf11]"
  'F12'       "$terminfo[kf12]"
  'Insert'    "$terminfo[kich1]"
  'Home'      "$terminfo[khome]"
  'PageUp'    "$terminfo[kpp]"
  'End'       "$terminfo[kend]"
  'PageDown'  "$terminfo[knp]"
  'Up'        "$terminfo[kcuu1]"
  'Left'      "$terminfo[kcub1]"
  'Down'      "$terminfo[kcud1]"
  'Right'     "$terminfo[kcuf1]"
  'BackTab'   "$terminfo[kcbt]"
)

# Do not bind any keys if there are empty values in $keyinfo.
for key in "$keyinfo[@]"; do
  if [[ -z "$key" ]]; then
    print "omz: one or more keys are non-bindable" >&2
    return
  fi
done

# Displays the current vi mode.
function zle-line-init zle-line-finish zle-keymap-select {
  if [[ "$KEYMAP" == 'vicmd' ]]; then
    zstyle -s ':omz:prompt:vi' command 'vi_prompt_info'
  else
    zstyle -s ':omz:prompt:vi' insert 'vi_prompt_info'
  fi
  zle reset-prompt
  zle -R
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Expands .... to ../..
function expand-dot-to-parent-directory-path {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+='/..'
  else
    LBUFFER+='.'
  fi
}
zle -N expand-dot-to-parent-directory-path

# Displays an indicator when completing.
function expand-or-complete-with-indicator {
  local indicator
  zstyle -s ':omz:completion' indicator 'indicator'
  print -Pn "$indicator"
  zle expand-or-complete-prefix
  zle redisplay
}
zle -N expand-or-complete-with-indicator

# Inserts 'sudo ' at the beginning of the line.
function prepend-sudo {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N prepend-sudo

# Reset to default key bindings.
bindkey -d

# Emacs key bindings.
for key in "$keyinfo[Escape]"{B,b}; \
  bindkey -M emacs "$key" emacs-backward-word
for key in "$keyinfo[Escape]"{F,f}; \
  bindkey -M emacs "$key" emacs-forward-word
bindkey -M emacs "$keyinfo[Escape]$keyinfo[Left]" emacs-backward-word
bindkey -M emacs "$keyinfo[Escape]$keyinfo[Right]" emacs-forward-word

# Kill to the beginning of the line.
for key in "$keyinfo[Escape]"{K,k}; \
  bindkey -M emacs "$key" backward-kill-line

# Redo.
bindkey -M emacs "$keyinfo[Escape]_" redo

# Search previous character.
bindkey -M emacs "$keyinfo[Control]X$keyinfo[Control]B" vi-find-prev-char

# Match bracket.
bindkey -M emacs "$keyinfo[Control]X$keyinfo[Control]]" vi-match-bracket

# Edit command in an external editor.
bindkey -M emacs "$keyinfo[Control]X$keyinfo[Control]E" edit-command-line

# Bind to the history substring search plugin if enabled;
# otherwise, bind to built-in Zsh history search.
if (( $+plugins[(er)history-substring-search] )); then
  bindkey -M emacs "$keyinfo[Control]P" history-substring-search-up
  bindkey -M emacs "$keyinfo[Control]N" history-substring-search-down
else
  bindkey -M emacs "$keyinfo[Control]P" up-line-or-history
  bindkey -M emacs "$keyinfo[Control]N" down-line-or-history
fi

if (( $+widgets[history-incremental-pattern-search-backward] )); then
  bindkey -M emacs "$keyinfo[Control]R" \
    history-incremental-pattern-search-backward
  bindkey -M emacs "$keyinfo[Control]S" \
    history-incremental-pattern-search-forward
else
  bindkey -M emacs "$keyinfo[Control]R" \
    history-incremental-search-backward
  bindkey -M emacs "$keyinfo[Control]S" \
    history-incremental-search-forward
fi

# Vi key bindings.

# Edit command in an external editor.
bindkey -M vicmd "v" edit-command-line

# Show cursor position.
bindkey -M vicmd "ga" what-cursor-position

# Undo/Redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "$keyinfo[Control]R" redo

# Switch to command mode.
bindkey -M viins "jk" vi-cmd-mode
bindkey -M viins "kj" vi-cmd-mode

# History
bindkey -M vicmd "gg" beginning-of-history
bindkey -M vicmd "G" end-of-history

# Bind to the history substring search plugin if enabled;
# otherwise, bind to built-in Zsh history search.
if (( $+plugins[(er)history-substring-search] )); then
  bindkey -M vicmd "k" history-substring-search-up
  bindkey -M vicmd "j" history-substring-search-down
else
  bindkey -M vicmd "k" up-line-or-history
  bindkey -M vicmd "j" down-line-or-history
fi

if (( $+widgets[history-incremental-pattern-search-backward] )); then
  bindkey -M vicmd "?" history-incremental-pattern-search-backward
  bindkey -M vicmd "/" history-incremental-pattern-search-forward
else
  bindkey -M vicmd "?" history-incremental-search-backward
  bindkey -M vicmd "/" history-incremental-search-forward
fi

# Emacs and Vi key bindings.
for keymap in 'emacs' 'viins'; do
  bindkey -M "$keymap" "$keyinfo[Home]" beginning-of-line
  bindkey -M "$keymap" "$keyinfo[End]" end-of-line

  bindkey -M "$keymap" "$keyinfo[Insert]" overwrite-mode
  bindkey -M "$keymap" "$keyinfo[Delete]" delete-char
  bindkey -M "$keymap" "$keyinfo[Backspace]" backward-delete-char

  bindkey -M "$keymap" "$keyinfo[Left]" backward-char
  bindkey -M "$keymap" "$keyinfo[Right]" forward-char

  # Expand history on space.
  bindkey -M "$keymap" ' ' magic-space

  if (( $+plugins[(er)history-substring-search] )); then
    bindkey -M "$keymap" "$keyinfo[Up]" history-substring-search-up
    bindkey -M "$keymap" "$keyinfo[Down]" history-substring-search-down
  else
    bindkey -M "$keymap" "$keyinfo[Up]" up-line-or-history
    bindkey -M "$keymap" "$keyinfo[Down]" down-line-or-history
  fi

  # Clear screen.
  bindkey -M "$keymap" "$keyinfo[Control]L" clear-screen

  # Expand command name to full path.
  for key in "$keyinfo[Escape]"{E,e}; \
    bindkey -M "$keymap" "$key" expand-cmd-path

  # Duplicate the previous word.
  for key in "$keyinfo[Escape]"{M,m}; \
    bindkey -M "$keymap" "$key" copy-prev-shell-word

  # Use a more flexible push-line.
  for key in "$keyinfo[Control]Q" "$keyinfo[Escape]"{q,Q}; \
    bindkey -M "$keymap" "$key" push-line-or-edit

  # Bind Shift + Tab to go to the previous menu item.
  bindkey -M "$keymap" "$keyinfo[BackTab]" reverse-menu-complete

  # Complete in the middle of word.
  bindkey -M "$keymap" "$keyinfo[Control]I" expand-or-complete-prefix

  # Expand .... to ../..
  if zstyle -t ':omz:editor' dot-expansion; then
    bindkey -M "$keymap" "." expand-dot-to-parent-directory-path
  fi

  # Display an indicator when completing.
  bindkey -M "$keymap" "$keyinfo[Control]I" \
    expand-or-complete-with-indicator

  # Insert 'sudo ' at the beginning of the line.
  bindkey -M "$keymap" "$keyinfo[Control]X$keyinfo[Control]S" prepend-sudo
done

# Do not expand .... to ../.. during incremental search.
if zstyle -t ':omz:editor' dot-expansion; then
  bindkey -M isearch . self-insert 2> /dev/null
fi

# Set the key layout.
zstyle -s ':omz:editor' keymap 'keymap'
if [[ "$keymap" == (emacs|) ]]; then
  bindkey -e
elif [[ "$keymap" == vi ]]; then
  bindkey -v
else
  print "omz: invalid keymap: $keymap" >&2
fi

unset keymap
unset key

