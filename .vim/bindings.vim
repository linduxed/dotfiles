" Don't remove visual block when indenting.
vmap < <gv
vmap > >gv

" Buffer navigation
nmap <F1> :bprevious<CR>
nmap <F2> :bnext<CR>
" Lusty bindings
nmap <F3> :LustyBufferExplorer<CR>
nmap <F4> :LustyBufferGrep<CR>
" F5: bound in trailingspaces.vim file.
" Toggling the Gundo menu
nnoremap <F6> :GundoToggle<CR>
" Toggle paste mode
set pastetoggle=<F7>
" Toggle invisible characters.
nmap <F8> :set list!<CR>
" F9: bound in ttlhl.vim.
" Keybind for Tasklist
map <F10> <Plug>TaskList
" Keybind for Taglist
nmap <F11> :TlistToggle<CR>
" Keybind for NERD_Tree
nmap <F12> :NERDTree<CR>
let NERDTreeQuitOnOpen=1


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
