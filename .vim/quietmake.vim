function! QuietMake()
  write
  silent! make
  copen
  if empty(len(filter(getqflist(), 'v:val["valid"]')))
    cclose
  else
    wincmd w
  endif
  redraw!
endfunction

nnoremap <silent> <F9> :call QuietMake()<cr>
