fu! s:ToggleTooLongHL()  
	if exists('*matchadd')
		if ! exists("w:TooLongMatchNr")
			let last = (&tw <= 0 ? 80 : &tw)
			let w:TooLongMatchNr = matchadd('ErrorMsg', '.\%>' . (last+1) . 'v', 0)
			echo "Long Line Highlight"
		else
			call matchdelete(w:TooLongMatchNr)
			unlet w:TooLongMatchNr
			echo "No Long Line Highlight"
		endif
	endif
endf

nnoremap <F10> :call <SID>ToggleTooLongHL()<CR>
