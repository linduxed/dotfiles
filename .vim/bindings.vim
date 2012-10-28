" <Leader>w bound in trailingspaces.vim

" Paragraph reformatting.
nnoremap <Leader>q gqip

" Don't remove visual block when indenting.
vmap < <gv
vmap > >gv

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
nnoremap <S-Tab> i<Tab><Esc><Right>
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|

" Inserting spaces
nnoremap <Space> i<Space><Esc><Right>|
xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
xnoremap <silent> <S-Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv<<CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>

" Delete/Backspace
nnoremap <C-d> "_dw|vnoremap <C-d> "_d|inoremap <C-d> <Delete>|cnoremap <C-d> <Delete>|
nnoremap <Delete> "_x|vnoremap <Delete> "_d|
nnoremap <Backspace> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|

" Function keys
nmap <F1> :bprevious<CR>
nmap <F2> :bnext<CR>
nmap <F3> :CtrlPBuffer<CR>
nmap <F4> :LustyJuggler<CR>
nmap <F5> :LustyBufferGrep<CR>
nnoremap <F6> :GundoToggle<CR>
set pastetoggle=<F7>
nmap <F8> :set list!<CR>
nmap <F9> :make<CR>
" F10: not bound.
nmap <F11> :TlistToggle<CR>
nmap <F12> :NERDTree<CR>

" Navigate help file
" Use < and > to navigate in the help file
au FileType help nnoremap <buffer> < <C-t>|
au FileType help nnoremap <buffer> > <C-]>|
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|
au FileType help nnoremap <buffer> <silent> <expr> <Space> (winheight(0)-1) . "\<C-d>0"|
au FileType help nnoremap <buffer> <silent> <expr> <S-Space> (winheight(0)-1) . "\<C-u>0"|"

"Tip #1386, Make Vim completion popup menu work just like in an IDE
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"

" Miscellaneous tweaks
nnoremap ; :|xnoremap ; :|

let g:gundo_map_move_newer = "u"
let g:gundo_map_move_older = "e"

let g:EasyMotion_mapping_f = '<Leader><Leader>f'
let g:EasyMotion_mapping_F = '<Leader><Leader>F'
let g:EasyMotion_mapping_t = '<Leader><Leader>p'
let g:EasyMotion_mapping_T = '<Leader><Leader>P'
let g:EasyMotion_mapping_w = '<Leader><Leader>y'
let g:EasyMotion_mapping_W = '<Leader><Leader>Y'
let g:EasyMotion_mapping_b = '<Leader><Leader>l'
let g:EasyMotion_mapping_B = '<Leader><Leader>L'
let g:EasyMotion_mapping_e = '<Leader><Leader>i'
let g:EasyMotion_mapping_E = '<Leader><Leader>I'
let g:EasyMotion_mapping_ge = '<Leader><Leader>n'
let g:EasyMotion_mapping_gE = '<Leader><Leader>N'
let g:EasyMotion_mapping_j = '<Leader><Leader>e'
let g:EasyMotion_mapping_k = '<Leader><Leader>u'
let g:EasyMotion_mapping_n = '<Leader><Leader>k'
let g:EasyMotion_mapping_N = '<Leader><Leader>K'

let g:NERDTreeMapOpenExpl = 'y'
let g:NERDTreeMapUpdir = 'l'
let g:NERDTreeMapUpdirKeepOpen = 'L'

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-k>'],
    \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
    \ 'PrtHistory(-1)':       ['<c-j>'],
    \ 'PrtHistory(1)':        ['<c-h>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>', '<MiddleMouse>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<c-q>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtCurStart()':        ['<c-l>'],
    \ 'PrtCurEnd()':          ['<c-y>'],
    \ 'PrtCurLeft()':         ['<c-n>', '<left>'],
    \ 'PrtCurRight()':        ['<c-i>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteMRU()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-g>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>'],
    \ }

