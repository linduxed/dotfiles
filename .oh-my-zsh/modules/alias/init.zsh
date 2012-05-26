#
# Defines general aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
omodload 'spectrum'

setopt CORRECT # Correct commands.

# The 'ls' Family
if is-callable 'dircolors'; then
  # GNU core utilities.
  alias ls='ls --group-directories-first'

  if zstyle -t ':omz:module:alias:ls' color; then
    if [[ -s "$OMZ/dircolors" ]]; then
      eval "$(dircolors "$OMZ/dircolors")"
    else
      eval "$(dircolors)"
    fi
    alias ls="$aliases[ls] --color=auto"
  else
    alias ls="$aliases[ls] -F"
  fi
else
  # BSD core utilities.
  if zstyle -t ':omz:module:alias:ls' color; then
    export LSCOLORS="exfxcxdxbxegedabagacad"
    alias ls="ls -G"
  else
    alias ls='ls -F'
  fi
fi

alias l='ls -1A'         # List in one column.
alias ll='ls -lh'        # List human readable sizes.
alias lr='ll -R'         # List recursively.
alias la='ll -A'         # List hidden files.
alias lp='la | "$PAGER"' # List through pager.
alias lx='ll -XB'        # List sorted by extension.
alias lk='ll -Sr'        # List sorted by size, largest last.
alias lt='ll -tr'        # List sorted by date, most recent last.
alias lc='lt -c'         # List sorted by date, most recent last, show change time.
alias lu='lt -u'         # List sorted by date, most recent last, show access time.
alias sl='ls'            # I often screw this up.

# General
alias _='sudo'
alias b='${(z)BROWSER}'
alias cd='nocorrect cd'
alias cp='nocorrect cp -i'
alias e='${(z)EDITOR}'
alias find='noglob find'
alias fc='noglob fc'
alias gcc='nocorrect gcc'
alias history='noglob history'
alias ln='nocorrect ln -i'
alias locate='noglob locate'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir -p'
alias mv='nocorrect mv -i'
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias rake='noglob rake'
alias rm='nocorrect rm'
alias scp='nocorrect scp'
alias type='type -a'

alias mc='mc -u'
alias pull-all='find . -name ".git"  -type d -prune -execdir git pull \;'
alias unzip-all='for a in *.zip; do mkdir $a:r; pushd $a:r; unzip ../$a; popd; done'
alias pb='wgetpaste -X'

# Coloured versions of commands (if available)
if is-callable 'dfc'; then
  alias df='dfc'
else
  alias df='df -kh'
fi
if is-callable 'cdu'; then
  alias du='cdu -idh'
else
  alias du='du -kh'
fi

# Server logins
alias freke='ssh -R 8081:localhost:22 linduxed@freke.linduxed.se'

# Mac OS X
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
else
  alias o='xdg-open'
  alias get='wget --continue --progress=bar --timestamping'
  alias pbc='pbcopy'
  alias pbp='pbpaste'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  fi

  if (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

# Top
if (( $+commands[htop] )); then
  alias top=htop
else
  alias topm='top -o vsize'
  alias topc='top -o cpu'
fi

# Diff
if zstyle -t ':omz:module:alias:diff' color; then
  function diff {
    if (( $+commands[colordiff] )); then
      "$commands[diff]" --unified "$@" | colordiff --difftype diffu
    elif (( $+commands[git] )); then
      git --no-pager diff --color=auto --no-ext-diff --no-index "$@"
    else
      "$commands[diff]" --unified "$@"
    fi
  }

  function wdiff {
    if (( $+commands[wdiff] )); then
      "$commands[wdiff]" \
        --avoid-wraps \
        --start-delete="$(print -n $FG[red])" \
        --end-delete="$(print -n $FG[none])" \
        --start-insert="$(print -n $FG[green])" \
        --end-insert="$(print -n $FG[none])" \
        "$@" \
      | sed 's/^\(@@\( [+-][[:digit:]]*,[[:digit:]]*\)\{2\} @@\)$/;5;6m\10m/g'
    elif (( $+commands[git] )); then
      git --no-pager diff --color=auto --no-ext-diff --no-index --color-words "$@"
    else
      print "zsh: command not found: $0" >&2
    fi
  }
fi

# Make
if zstyle -t ':omz:module:alias:make' color; then
  function make {
    if (( $+commands[colormake] )); then
      colormake "$@"
    else
      "$commands[make]" "$@"
    fi
  }
fi

# Miscellaneous
if (( $+commands[ack] )) alias afind='nocorrect ack'
if (( $+commands[ebuild] )) alias ebuild='nocorrect ebuild'
if (( $+commands[gist] )) alias gist='nocorrect gist'
if (( $+commands[heroku] )) alias heroku='nocorrect heroku'
if (( $+commands[mysql] )) alias mysql='nocorrect mysql'

