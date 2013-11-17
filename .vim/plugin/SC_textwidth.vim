autocmd BufRead,BufNewFile ~/Documents/studentcompetitions/*
    \ if &ft == 'gitcommit' |
    \     setl tw=72 |
    \ else |
    \     setl tw=120 |
    \ endif
