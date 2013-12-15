autocmd BufRead,BufNewFile ~/Documents/sqore/*
    \ if &ft == 'gitcommit' |
    \     setl tw=72 |
    \ else |
    \     setl tw=120 |
    \ endif
