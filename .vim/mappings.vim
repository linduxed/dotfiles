" {{{1 Completion menu

"Tip #1386, Make Vim completion popup menu work just like in an IDE
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"

" {{{1 Fixed width formatting

nnoremap <Leader>f :let old_tw=&tw<CR>:let &tw=79<CR>gqip:let &tw=old_tw<CR>:echo "\r"<CR>
vnoremap <Leader>f <Esc>:let old_tw=&tw<CR>:set tw=79<CR>gvgq:let &tw=old_tw<CR><C-u>:echo "\r"<CR>

" {{{1 Function keys

nnoremap <F1> :buffer #<CR>
nnoremap <F2> :CtrlPBuffer<CR>
nnoremap <F3> :CtrlPTag<CR>
nnoremap <F4> :CtrlPRoot<CR>
nnoremap <F5> :CtrlPMRU<CR>
nnoremap <F6> :UndotreeToggle<CR>
nnoremap <F7> :NumbersToggle<CR>
nnoremap <F8> :set list!<CR>
nnoremap <F9> :make<CR>
" F10: not bound.
nnoremap <F11> :TagbarToggle<CR>
nnoremap <F12> :NERDTree<CR>

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

" {{{1 Miscellaneous

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
nnoremap <S-Tab> i<Tab><Esc><Right>
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Help file navigation
au FileType help nnoremap <buffer> < <C-t>|
au FileType help nnoremap <buffer> > <C-]>|
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|

" Inserting spaces
nnoremap <Space> i<Space><Esc><Right>|
xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
xnoremap <silent> <S-Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv<<CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>

" Delete/Backspace
nnoremap <C-d> "_dw|vnoremap <C-d> "_d|inoremap <C-d> <Delete>|cnoremap <C-d> <Delete>|
nnoremap <Delete> "_x|vnoremap <Delete> "_d|
nnoremap <Backspace> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

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
