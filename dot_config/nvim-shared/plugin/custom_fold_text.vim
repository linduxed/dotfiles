set foldtext=CustomFoldText()
fu! CustomFoldText()
	"get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let levelIndent = repeat('  ', max([0, v:foldlevel - 1]))
	let textoff = get(getwininfo(win_getid())[0], 'textoff', 0)
	let w = winwidth(0) - textoff
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = ' ' . foldSize . ' lines '
	let lineCount = line("$")
	let foldPercentage = printf('[%.1f%%] ', (foldSize * 1.0) / max([1, lineCount]) * 100)
	let rightText = foldSizeStr . foldPercentage

	let leftText = levelIndent . line
	let leftMax = max([0, w - strdisplaywidth(rightText) - 1])
	if strdisplaywidth(leftText) > leftMax
		let truncWidth = max([0, leftMax - 3])
		let leftText = strcharpart(leftText, 0, truncWidth) . '...'
	endif

	let expansionString = repeat('.', max([1, w - strdisplaywidth(leftText) - strdisplaywidth(rightText)]))
	return leftText . expansionString . rightText
endf
