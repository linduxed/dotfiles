vim.cmd([[
" {{{1 Miscellaneous

" Help file navigation
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|

" Reselection of pasted text (linewise or not, it adjusts)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" "Refocus" folds
nnoremap <Leader>afr zMzvzz

nnoremap <leader>afmi :set foldmethod=indent<CR>
nnoremap <leader>afmm :set foldmethod=marker<CR>

nnoremap <leader>ase :set spelllang=en<CR>
nnoremap <leader>ass :set spelllang=sv<CR>
nnoremap <leader>asp :set spelllang=pl<CR>

nnoremap <leader>atwz :set tw=0<CR>

" Yank contents of buffer
nnoremap <leader>ayb gg"+yG

nnoremap ]v :tabnext<CR>
nnoremap [v :tabprevious<CR>

nnoremap <leader>pp :echo @%<CR>
nnoremap <leader>py :let @+=@%<Bar>echo @% "- yanked"<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :e<CR>

nnoremap <leader>/ :nohlsearch<CR>

tnoremap <C-\> <C-\><C-n>

nnoremap <S-Up> <C-y>
nnoremap <S-Down> <C-e>

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
nnoremap <F2> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <F3> <cmd>lua require('telescope.builtin').tags()<cr>
nnoremap <F4> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <F5> <cmd>lua require('telescope.builtin').oldfiles()<cr>
" F6: bound elsewhere.
" F7: not bound.
" F8: not bound.
" F9: not bound.
" F10: not bound.
nnoremap <F11> :TagbarToggle<CR>
nnoremap <F12> <cmd>Neotree toggle<CR>

" {{{1 Change behaviour of standard functions

" Keep search matches in the middle of the window.
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" 1. Entering visual-mode is done while holding Shift.
" 2. colemak.vim maps "u" to "k" (moving up)
"
" These two together cause me to uppercase stuff when I just wanted to move
" up, causing frustration. Disable uppercasing with "U"; I can use "`" anyway.
vnoremap U k

" Disable splitting window and open first instance of word under cursor.
" I *never* use this feature, and it mostly causes me to split the window
" unintentionally when using <C-W>i with colemak.vim.
nmap <C-W><C-I> <C-W>l
]])

-- {{{1 StripTrailingWhitespace

vim.cmd([[
nnoremap <silent> <Leader>awk :StripTrailingWhitespace<CR>
]])
