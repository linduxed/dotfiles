" Highlight the following:
" * Trailing spaces
" * Spaces before leading tabs
" * Non-indenting tabs
" * Lines with only whitespace
" Turn off highlighting of trailing whitespace during insert-mode.
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter    * match ExtraWhitespace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+$\|^[ \t]\+$/
au InsertEnter * match ExtraWhitespace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+$\|^[ \t]\+$/

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
