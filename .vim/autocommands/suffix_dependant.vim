autocmd BufNewFile,BufRead *.html let g:ragtag_global_maps = 1
autocmd BufNewFile,BufRead *.html setlocal tw=0 sw=2 sts=2
autocmd BufNewFile,BufRead *.erb setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.eml let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.eml setlocal tw=72
autocmd BufNewFile,BufRead *.feature setlocal sw=2 sts=2
autocmd BufNewFile,BufRead */.warsow*/*.cfg set filetype=warsow
autocmd BufNewFile,BufRead *.c setlocal noet foldmethod=indent
autocmd BufNewFile,BufRead *.txt let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.txt setlocal syntax=off tw=0
autocmd BufNewFile,BufRead *.sass setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.haml setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.scss setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.coffee setlocal sw=2 sts=2
if exists('+colorcolumn')
	autocmd BufNewFile,BufRead *.txt setlocal colorcolumn=0
endif

" Add RSpec highlighting to non-Rails projects.
autocmd BufNewFile,BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let expect pending
highlight def link rubyRspec Function
