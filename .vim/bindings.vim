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
nmap <F10> :TaskList<CR>

" Keybind for Taglist
nmap <F11> :TlistToggle<CR>

" Keybind for NERD_Tree
nmap <F12> :NERDTree<CR>
let NERDTreeQuitOnOpen=1

cnoreabbr <expr> te (getcmdtype() . getcmdline() != ':te' ? 'te' : 'tabedit' )
