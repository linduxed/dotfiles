" {{{1 Miscellaneous

let mapleader = " "

" Help file navigation
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|

" Reselection of pasted text (linewise or not, it adjusts)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" "Refocus" folds
nnoremap <Leader>b zMzvzz

nnoremap ]v :tabnext<CR>
nnoremap [v :tabprevious<CR>

nnoremap <leader>pp :echo @%<CR>
nnoremap <leader>py :let @*=@%<Bar>echo @% "- yanked"<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :e<CR>

tnoremap <C-\> <C-\><C-n>

" {{{2 Make * in visual-mode behave smarter

function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" {{{2 Split line and remove potential trailing whitespace

function! s:SplitLine()
    exe "norm! i\<CR>"
    norm! ^mwgk
    s/\v *$//
    norm! `w
    delmarks w
endfunction
nnoremap <Leader><CR> :call <SID>SplitLine()<CR>

" {{{1 Completion menu

"Tip #1386, Make Vim completion popup menu work just like in an IDE
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"

" {{{1 Function keys

nnoremap <F1> :buffer #<CR>
nnoremap <F2> :Buffers<CR>
nnoremap <F3> :Tags<CR>
nnoremap <F4> :GitFiles<CR>
nnoremap <F5> :History<CR>
nnoremap <F6> :UndotreeToggle<CR>
" F7: not bound.
nnoremap <F8> :set list!<CR>
nnoremap <F9> :make<CR>
" F10: not bound.
nnoremap <F11> :TagbarToggle<CR>
nnoremap <F12> :NERDTreeToggle<CR>

" {{{1 Whitespace highlighting

nnoremap <silent> <Leader>awe :highlight ExtraWhitespace ctermbg=red guibg=red<CR>
nnoremap <silent> <Leader>awd :highlight ExtraWhitespace ctermbg=none guibg=none<CR>

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

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|

" 1. Entering visual-mode is done while holding Shift.
" 2. colemak.vim maps "u" to "k" (moving up)
"
" These two together cause me to uppercase stuff when I just wanted to move
" up, causing frustration. Disable uppercasing with "U"; I can use "`" anyway.
vnoremap U k
