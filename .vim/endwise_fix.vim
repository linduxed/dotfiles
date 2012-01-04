inoremap <expr> <silent> <Cr> <SID>CrInInsertModeBetterWay()

function! s:CrInInsertModeBetterWay()
  return pumvisible() ? neocomplcache#close_popup()."\<Cr>" : "\<Cr>"
endfunction
