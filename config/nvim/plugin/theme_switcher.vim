function! Light()
	let g:solarized_termtrans = 0
	set background=light
	colorscheme solar_linduxed
	RainbowParenthesesActivate
	runtime plugin/special_highlights.vim
endfunction

function! Dark()
	let g:solarized_termtrans = 1
	set background=dark
	colorscheme solar_linduxed
	RainbowParenthesesActivate
	runtime plugin/special_highlights.vim
endfunction

command! Light call Light()
command! Dark  call Dark()
