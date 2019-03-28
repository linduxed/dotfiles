function! Light()
	set background=light
	colorscheme solar_linduxed
	RainbowParenthesesActivate
	runtime plugin/special_highlights.vim
endfunction

function! Dark()
	set background=dark
	colorscheme solar_linduxed
	RainbowParenthesesActivate
	runtime plugin/special_highlights.vim
endfunction

command! Light call Light()
command! Dark  call Dark()
