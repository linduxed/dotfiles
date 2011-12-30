# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
 
# Show history
alias history='fc -l 1'

# ls aliases
alias ls='ls --color=auto -p'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# rsync aliases
alias copy='rsync -aP'
alias copy-checksum='rsync -azcP'
alias copy-ignore-existing='rsync -aP --ignore-existing'

# Miscellaneous
alias tmux='tmux -2'
alias attach-tmux='tmux attach'
alias mc='mc -u'
alias pull-all='find . -name ".git"  -type d -prune -execdir git pull \;'
alias unzip-all='for a in *.zip; do mkdir $a:r; pushd $a:r; unzip ../$a; popd; done'

# Server logins
alias freke='ssh -R 8081:localhost:22 linduxed@freke.linduxed.se'
alias pb='wgetpaste'
