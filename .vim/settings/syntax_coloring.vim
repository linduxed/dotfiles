" Load Doxygen syntax colouring on top of normal C/C++/Java/PHP/IDL syntax.
let g:load_doxygen_syntax=1

" Highlight trailing spaces, spaces before leading tabs, non-indenting tabs and
" lines with only whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+$\|^[ \t]\+$/
au InsertEnter * match ExtraWhitespace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+$\|^[ \t]\+$/

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
