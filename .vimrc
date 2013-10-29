" {{{ Preamble

" Load all plugins with pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Check filetype for plugins.
filetype indent plugin on

" Fallback indentation.
set autoindent

" Make Vim behave in a more useful way.
set nocompatible

" }}}
" {{{ Source external settings

" Add colemak mappings.
source ~/.vim/colemak.vim

" }}}
" {{{ Functions

" {{{ Stab

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction

" }}}
" {{{ ClearRegisters

function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearRegisters call ClearRegisters()

" }}}
" {{{ Theme switching

function! Light()
	let g:solarized_termtrans = 0
	set background=light
	colorscheme solar_linduxed
	RainbowParenthesesActivate
endfunction

function! Dark()
	let g:solarized_termtrans = 1
	set background=dark
	colorscheme solar_linduxed
	RainbowParenthesesActivate
endfunction

command! Light call Light()
command! Dark  call Dark()

" }}}

" }}}
" {{{ Options

" {{{ Colorscheme

syntax on
set background=dark

if !has('gui_running')
	set t_Co=256
	let g:solarized_termcolors=256
endif

let g:solarized_termtrans  = 1
let g:solarized_degrade    = 0
let g:solarized_bold       = 1
let g:solarized_underline  = 1
let g:solarized_italic     = 1
let g:solarized_contrast   = "normal"
let g:solarized_visibility = "normal"

colorscheme solar_linduxed

" }}}
" {{{ Miscellaneous

set nostartofline
set whichwrap=b,s,[,],<,>,h,l
set virtualedit=block
set lazyredraw
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set incsearch
set backspace=indent,eol,start
set winaltkeys=no
set ruler
set showcmd
set hlsearch
set ignorecase
set smartcase
set showtabline=1
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set hidden
set cursorline
set cursorcolumn
set mouse=n
set foldmethod=marker
set laststatus=2
set showbreak=…
set wildmenu
set formatoptions=qrn1t
set nojoinspaces
set textwidth=79
set undofile
set iskeyword+=-
set history=50
set splitright
set shiftround
set autoread
if exists('+colorcolumn')
	set colorcolumn=+1
endif

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Omnicompletion
set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Textmate style invisible chars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Resize splits when the window is resized
au VimResized * :wincmd =

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Treat <li> and <p> tags in HTML like block tags
let g:html_indent_tags = 'li\|p'

" Set order of tagfiles.
set tags=./tags,./TAGS,tags,TAGS,~/.vimtags

let g:netrw_liststyle = 3

" }}}
" {{{ Syntax colouring

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

" }}}
" {{{ Cursorline
" Only show cursorline in the current window and in normal mode.

augroup cline
	au!
	au WinLeave,InsertEnter * set nocursorline
	au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" {{{ foldtext

set foldtext=CustomFoldText()
fu! CustomFoldText()
	"get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = " " . foldSize . " lines "
	let foldLevelStr = repeat("+--", v:foldlevel)
	let lineCount = line("$")
	let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
	let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

" }}}
" {{{ Wildmenu completion

set wildmenu
" First tab: longest common string. Second tab: cycle through list.
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" }}}
" {{{ viminfo

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,n~/.vim/viminfo

" }}}
" {{{ Backups

set backup                        " enable backups

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
	call mkdir(expand(&directory), "p")
endif

" }}}

" }}}
" {{{ Plugin settings

" {{{ RainbowParentheses

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
" Haskell comment syntax breaks with Rainbow on.
autocmd Syntax * if &ft != "haskell" | exec "RainbowParenthesesLoadBraces" | endif

" Custom set of colours.
" Basically the defaults without the 'black' entry (poor visibility).
" Order has been moved around so that each step has more contrast.
let g:rbpt_colorpairs = [
	\ ['blue',        'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['brown',       'RoyalBlue3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['blue',        'firebrick3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]
" For the colours to loop properly, rbpt_max needs to equal the length
" of rbpt_colorpairs.
let g:rbpt_max = 15

" }}}
" {{{ CTRL-P

let g:ctrlp_max_height = 25
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp-cache'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_multi = '2v'
let g:ctrlp_custom_ignore = { 'dir': 'tmp' }

" Make CtrlP use ag (if it is present) for listing the files.
if executable("ag")
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" }}}
" {{{ snipMate

let g:snips_author = 'linduxed'

" }}}
" {{{ NERD-Commenter

let NERDSpaceDelims = 1 " Add spaces around the comment signs for all languages
" Since Alt style is not implemented at the moment, use custom delimiters instead.
let g:NERDCustomDelimiters = {
	\ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
	\ 'hspec': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
	\ 'c': { 'leftAlt': '/*','rightAlt': '*/', 'left': '//', 'right': '' },
\ }

" }}}
" {{{ Gist

let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'firefox %URL% &'

" }}}
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
