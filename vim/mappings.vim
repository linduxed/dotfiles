" {{{1 Completion menu

"Tip #1386, Make Vim completion popup menu work just like in an IDE
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"

" {{{1 Function keys

nnoremap <F1> :buffer #<CR>
nnoremap <F2> :CtrlPBuffer<CR>
nnoremap <F3> :CtrlPTag<CR>
nnoremap <F4> :CtrlPRoot<CR>
nnoremap <F5> :CtrlPMRU<CR>
nnoremap <F6> :UndotreeToggle<CR>
" F7: not bound.
nnoremap <F8> :set list!<CR>
nnoremap <F9> :make<CR>
" F10: not bound.
nnoremap <F11> :TagbarToggle<CR>
" F12: not bound.

" {{{1 Whitespace highlighting

nnoremap <silent> <Leader>we :highlight ExtraWhitespace ctermbg=red guibg=red<CR>
nnoremap <silent> <Leader>wd :highlight ExtraWhitespace ctermbg=none guibg=none<CR>

" {{{1 Change behaviour of standard functions

" Keep search matches in the middle of the window.
nnoremap k nzzzv
nnoremap K Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Don't remove visual block when indenting.
vmap < <gv
vmap > >gv

" {{{2 Make * in visual-mode behave smarter

function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" {{{1 Miscellaneous

let mapleader = " "

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
nnoremap <S-Tab> i<Tab><Esc><Right>
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|

" Help file navigation
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|

" Reselection of pasted text (linewise or not, it adjusts)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Split line
nnoremap <Leader><CR> i<CR><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w:delmarks w<CR>

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" "Refocus" folds
nnoremap <Leader>b zMzvzz

nnoremap ]v :tabnext<CR>
nnoremap [v :tabprevious<CR>

nnoremap <leader>fp :echo @%<CR>
nnoremap <leader>fy :let @*=@%<Bar>echo @% "- yanked"<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
