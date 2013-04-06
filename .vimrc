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

" }}}
" {{{ Options

" {{{ Miscellaneous

syntax on                       " Enable syntax highlighting.
colorscheme linduxed            " Use my theme.
set nostartofline               " Keep cursor in the same column if possible.
set whichwrap=b,s,[,],<,>,h,l   " Allow cursor to wrap between lines.
set virtualedit=block           " Allow virtual editing in Visual block mode.
set lazyredraw                  " Don't redraw screen while executing macros/mappings.
set scrolloff=5                 " Minimal number of screen lines to keep above and below the cursor.
set sidescroll=1                " Minimal number of characters from the edge with :wrap.
set sidescrolloff=10            " Minimal number of characters from the edge with :nowrap.
set incsearch                   " Enable incremental search.
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set winaltkeys=no               " Allow mapping of alt (meta) key shortcuts.
set ruler                       " Show the cursor position all the time.
set showcmd                     " Display incomplete commands.
set hlsearch                    " Highlight search patterns.
set ignorecase                  " Ignore case.
set smartcase                   " Ignore case when the pattern contains lowercase letters only.
set showtabline=1               " Show tab page labels if there is more than one tab.
set number                      " Display line numbers.
set shiftwidth=4                " Spaces for each step of (auto)indent
set tabstop=4                   " Spaces that a <Tab> in the file counts for
set softtabstop=4               " Spaces that a <Tab> counts for when editing
set hidden                      " Allows hidden buffers
set cursorline                  " Shows what line the cursor is on
set cursorcolumn                " Shows what column the cursor is on
set mouse=n                     " Allow the mouse in normal mode.
set foldmethod=marker           " Make Vim fold with the help of markers.
set laststatus=2                " Always show the statusline.
set showbreak=…                 " Add an ellipsis at the start of wrapped lines.
set wildmenu                    " Command completion menu.
set formatoptions=qrn1t         " Check :help fo-table.
set nojoinspaces                " No double spaces after ./!/? when lines are joined.
set textwidth=79                " Wrap on set column.
set undofile                    " Persistent undos between sessions.
set gdefault                    " When searching, use the 'g' flag all the time.
if exists('+colorcolumn')
	set colorcolumn=+1          " Display a column, one column after the text width.
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

" }}}
" {{{ Syntax colouring

" Load Doxygen syntax colouring on top of normal C/C++/Java/PHP/IDL syntax.
let g:load_doxygen_syntax=1

" Highlight trailing spaces, spaces before leading tabs and non-indenting tabs.
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /[^\t]\zs\t\+\| \+\ze\t\|\S\zs\s\+$/

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

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

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
" {{{ Powerline

if hostname() != 'freke'
	let g:Powerline_symbols = 'fancy'
endif
set encoding=utf-8 " Necessary to show unicode glyphs.

" }}}
" {{{ CTRL-P

let g:ctrlp_max_height = 25
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp-cache'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_multi = '2v'

" }}}
" {{{ snipMate

let g:snips_author = 'linduxed'

" }}}
" {{{ NERD-Tree

let NERDTreeQuitOnOpen=1

" }}}
" {{{ NERD-Commenter

let NERDSpaceDelims = 1 " Add spaces around the comment signs for all languages
" Since Alt style is not implemented at the moment, use custom delimiters instead.
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
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
autocmd BufNewFile,BufRead *.eml let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.hs setlocal et sts=0
autocmd BufNewFile,BufRead *.feature setlocal et sw=2 sts=2
autocmd BufNewFile,BufRead */.warsow*/*.cfg set filetype=warsow
autocmd BufNewFile,BufRead *.c setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.txt let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.txt setlocal syntax=off tw=0
if exists('+colorcolumn')
	autocmd BufNewFile,BufRead *.txt setlocal colorcolumn=0
endif

" }}}
" {{{ Filetype dependant autocommands

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType ruby compiler ruby
autocmd FileType ruby et sw=2 sts=2
autocmd FileType haskell setlocal tw=120 omnifunc=necoghc#omnifunc
autocmd FileType gitcommit setlocal tw=72
autocmd FileType vim setlocal tw=0
if exists('+colorcolumn')
	autocmd FileType vim setlocal colorcolumn=0
endif

" }}}
" {{{ Miscellaneous

" Turn off paste automatically.
autocmd InsertLeave * set nopaste

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

nnoremap <silent> <Leader>w :call <SID>StripTrailingWhitespaces()<CR>

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

nmap <F1> :buffer #<CR>
nmap <F2> :Bufferlist<CR>
nmap <F3> :CtrlPBuffer<CR>
nmap <F4> :CtrlPRoot<CR>
nmap <F5> :CtrlPMRU<CR>
nnoremap <F6> :GundoToggle<CR>
" F7: not bound.
nmap <F8> :set list!<CR>
nmap <F9> :make<CR>
" F10: not bound.
nmap <F11> :TagbarToggle<CR>
nmap <F12> :NERDTree<CR>


" }}}
" {{{ Help file navigation

" Use < and > to navigate in the help file
au FileType help nnoremap <buffer> < <C-t>|
au FileType help nnoremap <buffer> > <C-]>|
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|
au FileType help nnoremap <buffer> <silent> <expr> <Space> (winheight(0)-1) . "\<C-d>0"|
au FileType help nnoremap <buffer> <silent> <expr> <S-Space> (winheight(0)-1) . "\<C-u>0"|"

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

" Easier linewise reselection
nnoremap <leader>V V`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line
nnoremap <Leader><CR> i<CR><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w:delmarks w<CR>

nnoremap ; :|xnoremap ; :|

" }}}
" {{{ Plugin specific

" {{{ Gundo

let g:gundo_map_move_newer = "u"
let g:gundo_map_move_older = "e"

" }}}
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
" {{{ NERD-Tree

let g:NERDTreeMapOpenExpl = 'y'
let g:NERDTreeMapUpdir = 'l'
let g:NERDTreeMapUpdirKeepOpen = 'L'

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

let g:snips_trigger_key='<C-h>'
let g:snips_trigger_key_backwards='<C-b>'

" }}}
" {{{ Tabular

vnoremap <Leader>te :Tabularize / = /l0<CR>
nnoremap <Leader>te :Tabularize / = /l0<CR>

" }}}

" }}}
" {{{ Fixed width text formatting

nnoremap <Leader>q :let old_tw=&tw<CR>:let &tw=79<CR>gqip:let &tw=old_tw<CR>:echo "\r"<CR>
vnoremap <Leader>q <Esc>:let old_tw=&tw<CR>:set tw=79<CR>gvgq:let &tw=old_tw<CR><C-u>:echo "\r"<CR>

" }}}

" }}}
