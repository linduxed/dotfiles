function! Light()
	let g:solarized_termtrans = 0
	set background=light
	colorscheme solar_linduxed
	RainbowParenthesesActivate
endfunction

function! Dark()
	let g:solarized_termtrans = 1
	set background=dark
	colorscheme solar_linduxed
	RainbowParenthesesActivate
endfunction

command! Light call Light()
command! Dark  call Dark()
