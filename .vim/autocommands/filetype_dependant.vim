autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java setlocal noet
autocmd FileType ruby compiler ruby
autocmd FileType ruby setlocal foldmethod=indent
autocmd FileType ruby setlocal foldlevel=1
autocmd FileType ruby IndentGuidesEnable
autocmd FileType ruby setlocal sw=2 sts=2
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell setlocal sts=0
autocmd FileType gitcommit setlocal spell tw=72 complete+=kspell
autocmd FileType markdown setlocal spell complete+=kspell linebreak
autocmd FileType vim setlocal tw=0
autocmd FileType tex setlocal spell complete+=kspell
autocmd FileType coffee setlocal foldmethod=indent
autocmd FileType coffee IndentGuidesEnable
autocmd FileType coffee setlocal sw=2 sts=2
if exists('+colorcolumn')
	autocmd FileType vim setlocal colorcolumn=0
endif
