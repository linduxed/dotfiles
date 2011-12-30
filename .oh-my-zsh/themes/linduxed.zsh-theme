autoload -Uz vcs_info

function precmd {
	vcs_info 'prompt'

	local TERMWIDTH
	(( TERMWIDTH = ${COLUMNS} - 1 ))

	###
	# Truncate the path if it's too long.

	PR_FILLBAR=""
	PR_PWDLEN=""

	local promptsize=${#${(%):---(%n@%m)---()--}}
	local pwdsize=${#${(%):-%~}}

	if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
		((PR_PWDLEN=$TERMWIDTH - $promptsize))
	else
	PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
	fi
}


preexec () {
	if [[ "$TERM" == "screen" ]]; then
	local CMD=${1[(wr)^(*=*|sudo|-*)]}
	echo -n "\ek$CMD\e\\"
	fi
}


setprompt () {
	###
	# Need this so the prompt will work.
	setopt prompt_subst

	###
	# Check for ability to use colors.
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"
	PR_RESET="%{${reset_color}%}"


	###
	# See if we can use extended characters to look nicer.
	typeset -A altchar
	set -A altchar ${(s..)terminfo[acsc]}
	PR_SET_CHARSET="%{$terminfo[enacs]%}"
	PR_SHIFT_IN="%{$terminfo[smacs]%}"
	PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
	PR_HBAR=${altchar[q]:--}
	PR_ULCORNER=${altchar[l]:--}
	PR_LLCORNER=${altchar[m]:--}
	PR_LRCORNER=${altchar[j]:--}
	PR_URCORNER=${altchar[k]:--}

	# set formats
	# %b - branchname
	# %u - unstagedstr (see below)
	# %c - stagedstr (see below)
	# %a - action (e.g. rebase-i)
	# %R - repository path
	# %S - path in the repository
	FMT_BRANCH="${PR_YELLOW}%b%u%c${PR_RESET}" # e.g. master¹²
	FMT_ACTION="(${PR_CYAN}%a${PR_RESET}%)"    # e.g. (rebase-i)
	FMT_PATH="%R${PR_YELLOW}/%S"			   # e.g. ~/repo/subdir
	LEFT_EMBRACE="$PR_CYAN$PR_HBAR$PR_BLUE$PR_HBAR$PR_SHIFT_OUT("
	RIGHT_EMBRACE="$PR_BLUE)$PR_SHIFT_IN$PR_HBAR"

	# check-for-changes can be really slow.
	# you should disable it, if you work with large repositories
	zstyle ':vcs_info:*:prompt:*' check-for-changes true
	zstyle ':vcs_info:*:prompt:*' stagedstr "${PR_GREEN}●"  # display green ball if there are staged changes
	zstyle ':vcs_info:*:prompt:*' unstagedstr "${PR_RED}●"  # display red ball if there are unstaged changes
	zstyle ':vcs_info:*:prompt:*' actionformats "$LEFT_EMBRACE${FMT_BRANCH}${FMT_ACTION}$RIGHT_EMBRACE" "${FMT_PATH}"
	zstyle ':vcs_info:*:prompt:*' formats		"$LEFT_EMBRACE${FMT_BRANCH}$RIGHT_EMBRACE"				"${FMT_PATH}"
	zstyle ':vcs_info:*:prompt:*' nvcsformats	""														"%~"

	###
	# Decide if we need to set titlebar text.
	case $TERM in
	xterm*)
		PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
		;;
	screen)
		PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
		;;
	*)
		PR_TITLEBAR=''
		;;
	esac


	###
	# Decide whether to set a screen title
	if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
	else
	PR_STITLE=''
	fi

	local vcs='$vcs_info_msg_0_'

	###
	# Finally, the prompt.
	PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_GREEN%(!.$PR_RED%SROOT%s.%n)$PR_YELLOW@$PR_GREEN%m\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR${(e)PR_FILLBAR}$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_MAGENTA%$PR_PWDLEN<...<%~%<<\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_LIGHT_RED%?$PR_BLUE:)\
${(e)PR_APM}$PR_YELLOW%D{%H:%M}\
$PR_LIGHT_BLUE:%(!.$PR_RED.$PR_WHITE)%#$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_NO_COLOUR '

	RPROMPT="$PR_SHIFT_IN${vcs}$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR"

	PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt

