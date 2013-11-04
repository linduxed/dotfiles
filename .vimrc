" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype indent plugin on

" Load settings
source ~/.vim/colemak.vim
source ~/.vim/utilities/stab.vim
source ~/.vim/utilities/clear_registers.vim
source ~/.vim/utilities/theme_switcher.vim
source ~/.vim/settings/colorscheme.vim
source ~/.vim/settings/miscellaneous.vim
source ~/.vim/settings/syntax_coloring.vim
source ~/.vim/settings/colorline.vim
source ~/.vim/settings/foldtext.vim
source ~/.vim/settings/wildmenu.vim
source ~/.vim/settings/viminfo.vim
source ~/.vim/settings/backups.vim
source ~/.vim/plugin-settings/rainbow_parentheses.vim
source ~/.vim/plugin-settings/ctrlp.vim
source ~/.vim/plugin-settings/snipmate.vim
source ~/.vim/plugin-settings/nerd_commenter.vim
source ~/.vim/plugin-settings/gist.vim

" {{{ Plugin settings

" {{{ minibufexpl

let g:miniBufExplSetUT = 0

" }}}
" {{{ Ack

" Use Silver Searcher if present on the system.
if executable("ag")
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" }}}
" {{{ Syntastic

let g:syntastic_always_populate_loc_list=1

" }}}
" {{{ Indent guides

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermfg=none ctermbg=234 cterm=none
hi IndentGuidesEven ctermfg=none ctermbg=235 cterm=none

" }}}
" {{{ Textile

let g:TextileOS="Linux"
let g:TextileBrowser="/usr/bin/firefox"

" }}}
" {{{ rspec

let g:rspec_command = "!bundle exec rspec -c {spec}"

" }}}
" {{{ Text objects

" Default bindings disabled for remapping to colemak bindings.
let g:textobj_rubyblock_no_default_key_mappings = 1
let g:textobj_indent_no_default_key_mappings = 1
let g:textobj_space_no_default_key_mappings = 1
let g:textobj_underscore_no_default_key_mappings = 1
let g:textobj_url_no_default_key_mappings = 1

" }}}
" {{{ delimitMate

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" }}}
" {{{ airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" }}}
" {{{ markdown

let g:markdown_fenced_languages = ['ruby', 'haskell', 'vim', 'sh', 'c']

" }}}

" }}}
" {{{ Autocommands

" {{{ Restore cursor position

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
" Open fold if cursor is restored inside a fold.
if has("folding")
	function! UnfoldCur()
		if !&foldenable
			return
		endif
		let cl = line(".")
		if cl <= 1
			return
		endif
		let cf  = foldlevel(cl)
		let uf  = foldlevel(cl - 1)
		let min = (cf > uf ? uf : cf)
		if min
			execute "normal!" min . "zo"
			return 1
		endif
	endfunction
endif

" Initiate cursor restoration.
augroup resCur
	autocmd!
	if has("folding")
		autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
	else
		autocmd BufWinEnter * call ResCur()
	endif
augroup END

" }}}
" {{{ Suffix dependant autocommands

autocmd BufNewFile,BufRead *.html let g:ragtag_global_maps = 1
autocmd BufNewFile,BufRead *.html setlocal tw=0 sw=2 sts=2
autocmd BufNewFile,BufRead *.erb setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.eml let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.eml setlocal tw=72
autocmd BufNewFile,BufRead *.feature setlocal sw=2 sts=2
autocmd BufNewFile,BufRead */.warsow*/*.cfg set filetype=warsow
autocmd BufNewFile,BufRead *.c setlocal noet foldmethod=indent
autocmd BufNewFile,BufRead *.txt let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.txt setlocal syntax=off tw=0
autocmd BufNewFile,BufRead *.sass setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.haml setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.scss setlocal sw=2 sts=2
autocmd BufNewFile,BufRead *.coffee setlocal sw=2 sts=2
if exists('+colorcolumn')
	autocmd BufNewFile,BufRead *.txt setlocal colorcolumn=0
endif

" Add RSpec highlighting to non-Rails projects.
autocmd BufNewFile,BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let expect pending
highlight def link rubyRspec Function

" }}}
" {{{ Filetype dependant autocommands

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java setlocal noet
autocmd FileType ruby compiler ruby
autocmd FileType ruby setlocal foldmethod=indent
autocmd FileType ruby setlocal foldlevel=1
autocmd FileType ruby IndentGuidesEnable
autocmd FileType ruby setlocal sw=2 sts=2
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell setlocal sts=0
autocmd FileType gitcommit setlocal spell tw=72 complete+=kspell
autocmd FileType markdown setlocal spell complete+=kspell linebreak
autocmd FileType vim setlocal tw=0
autocmd FileType tex setlocal spell complete+=kspell
autocmd FileType coffee setlocal foldmethod=indent
autocmd FileType coffee IndentGuidesEnable
autocmd FileType coffee setlocal sw=2 sts=2
if exists('+colorcolumn')
	autocmd FileType vim setlocal colorcolumn=0
endif

" }}}
" {{{ Miscellaneous

autocmd BufRead,BufNewFile ~/Documents/studentcompetitions/*
    \ if &ft == 'gitcommit' |
    \     setl tw=72 |
    \ else |
    \     setl tw=120 |
    \ endif

" }}}

" }}}
" {{{ Mappings

" {{{ Trailing whitespace

function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

nnoremap <silent> <Leader>wk :call <SID>StripTrailingWhitespaces()<CR>

" }}}
" {{{ Highlight whitespace

nnoremap <silent> <Leader>we :highlight ExtraWhitespace ctermbg=red guibg=red<CR>
nnoremap <silent> <Leader>wd :highlight ExtraWhitespace ctermbg=none guibg=none<CR>

" }}}
" {{{ Visual Mode */# from Scrooloose

function! s:VSetSearch()
	let temp = @@
	norm! gvy
	let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}
" {{{ Searching and jumping

" Keep search matches in the middle of the window.
nnoremap k nzzzv
nnoremap K Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" }}}
" {{{ Selection and folds

" "Refocus" folds
nnoremap <Leader>b zMzvzz

" Don't remove visual block when indenting.
vmap < <gv
vmap > >gv

" }}}
" {{{ Function keys

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

" }}}
" {{{ Completion menu

"Tip #1386, Make Vim completion popup menu work just like in an IDE
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"

" }}}
" {{{ Miscellaneous

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
nnoremap <S-Tab> i<Tab><Esc><Right>
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|

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

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line
nnoremap <Leader><CR> i<CR><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w:delmarks w<CR>

" }}}
" {{{ Plugin specific

" {{{ EasyMotion

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

" }}}
" {{{ CTRL-P

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

" }}}
" {{{ snipMate

imap <C-h>      <Plug>snipMateNextOrTrigger
smap <C-h>      <Plug>snipMateNextOrTrigger
imap <C-b>      <Plug>snipMateBack
smap <C-b>      <Plug>snipMateBack
imap <C-r><C-h> <Plug>snipMateShow
smap <C-r><C-h> <Plug>snipMateShow

" }}}
" {{{ Tabular

vnoremap <Leader>te :Tabularize / = /l0<CR>
nnoremap <Leader>te :Tabularize / = /l0<CR>
vnoremap <Leader>tc :Tabularize /:\zs/l0l1<CR>
nnoremap <Leader>tc :Tabularize /:\zs/l0l1<CR>

" }}}
" {{{ Indent guides

nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" }}}
" {{{ rspec

nmap <Leader>st :call RunCurrentSpecFile()<CR>
nmap <Leader>sr :call RunNearestSpec()<CR>
nmap <Leader>ss :call RunLastSpec()<CR>

" }}}
" {{{ Text objects

" Bindings adjusted to work with colemak.vim.
xmap tr <Plug>(textobj-rubyblock-a)
omap tr <Plug>(textobj-rubyblock-a)
xmap rr <Plug>(textobj-rubyblock-i)
omap rr <Plug>(textobj-rubyblock-i)
xmap ti <Plug>(textobj-indent-a)
omap ti <Plug>(textobj-indent-a)
xmap ri <Plug>(textobj-indent-i)
omap ri <Plug>(textobj-indent-i)
xmap tS <Plug>(textobj-space-a)
omap tS <Plug>(textobj-space-a)
xmap rS <Plug>(textobj-space-i)
omap rS <Plug>(textobj-space-i)
xmap t_ <Plug>(textobj-underscore-a)
omap t_ <Plug>(textobj-underscore-a)
xmap r_ <Plug>(textobj-underscore-i)
omap r_ <Plug>(textobj-underscore-i)
xmap tu <Plug>(textobj-url-a)
omap tu <Plug>(textobj-url-a)
xmap ru <Plug>(textobj-url-i)
omap ru <Plug>(textobj-url-i)

" }}}
" {{{ signify

nmap <leader>ge <plug>(signify-next-jump)
nmap <leader>gu <plug>(signify-prev-jump)

" }}}

" }}}
" {{{ Fixed width text formatting

nnoremap <Leader>f :let old_tw=&tw<CR>:let &tw=79<CR>gqip:let &tw=old_tw<CR>:echo "\r"<CR>
vnoremap <Leader>f <Esc>:let old_tw=&tw<CR>:set tw=79<CR>gvgq:let &tw=old_tw<CR><C-u>:echo "\r"<CR>

" }}}
" {{{ Keyboard layout switching

nnoremap <Leader>lc :source ~/.vim/colemak.vim<CR>
nnoremap <Leader>lq :source ~/.vim/disable-colemak.vim<CR>

" }}}
" {{{ Tab switching

nnoremap ]v :tabnext<CR>
nnoremap [v :tabprevious<CR>

" }}}

" }}}
