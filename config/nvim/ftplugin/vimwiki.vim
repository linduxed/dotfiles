let g:autoclose_loaded = 0
setlocal tw=79
setlocal linebreak
setlocal nolist

nmap <silent><buffer> <C-J> <Plug>VimwikiPrevLink
nmap <silent><buffer> <C-H> <Plug>VimwikiNextLink
inoremap <expr><buffer><C-U> vimwiki#tbl#kbd_shift_tab()
inoremap <expr><buffer><C-E> vimwiki#tbl#kbd_tab()

imap <silent> [[ [[<esc><Plug>ZettelSearchMap
nmap gpy <Plug>ZettelYankNameMap
xmap z <Plug>ZettelNewSelectedMap
nmap gZ <Plug>ZettelReplaceFileWithLink
nmap <Leader>z :ZettelNew<CR>
