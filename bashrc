if [[ -n $PS1 ]] ; then
    export HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac


    unset color_prompt force_color_prompt

    case "$TERM" in
    xterm*|rxvt*)
        PS1='\[\e[1;31m\][\[\e[1;36m\]\w\[\e[1;31m\]@\[\e[1;36m\]\h\[\e[1;31m\]]\[\e[1;33m\]$ \[\e[0m\]'
        ;;
    *)
        ;;
    esac

    if [ -x /usr/bin/dircolors ]; then
        eval "`dircolors -b ~/.zprezto/dircolors`"
        alias ls='ls --color=auto -p'
    fi

    alias ll='ls -l'
    alias lla='ls -la'
    alias la='ls -a'

    alias pb='pastebinit'
    alias wcmirror='mplayer -tv driver=v4l2:device=/dev/video0:fps=30 tv://'
    alias usb='pmount /dev/sdb1'
    alias unusb='pumount /dev/sdb1'
    alias usb2='pmount /dev/sdc1'
    alias unusb2='pumount /dev/sdc1'
    alias figdoh='clear && figlet -tc -f doh'

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    #Use GREP color features by default
    export GREP_OPTIONS='--color=auto'

    # Fix Java gray windows.
    export AWT_TOOLKIT=MToolkit

    export PATH=$PATH:/home/linduxed/bin/

    export EDITOR="vim"
fi
