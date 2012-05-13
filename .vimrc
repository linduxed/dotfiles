" Add colemak mappings.
source ~/.vim/colemak.vim
" Add custom bindings
source ~/.vim/bindings.vim
" Add the trailing whitespace stripper
source ~/.vim/trailingspaces.vim
" Add togglable highlighting of too long lines
source ~/.vim/ttlhl.vim
" Add the tab size setup tool
source ~/.vim/stab.vim
" Add fugitive related bindings and autocmd's
source ~/.vim/fugitive_related.vim"

" Needed for bundle-handler.
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles here:
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'adimit/prolog.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'godlygeek/tabular'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'nelstrom/vim-qargs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree.git'
Bundle 'sjbach/lusty'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/python.vim'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'vim-scripts/taglist.vim'
" vim-scripts repos
Bundle 'javacomplete'
Bundle 'octave.vim'
Bundle 'indenthaskell.vim'
Bundle 'syntaxhaskell.vim'
" other repos
Bundle "git://gitorious.org/vim-gnupg/vim-gnupg.git"


" Load appropriate theme
" if hostname() != 'freke' && hostname() != 'attana1'
if hostname() != 'attana1'
	" CSApprox fix for gnome-terminal
	if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
		set t_Co=256
	endif
	" Theme
	colorscheme linduxed
	"colorscheme lettuce
else
	let g:CSApprox_loaded = 0
endif

" Check filetype for plugins.
filetype indent plugin on

" Fallback indentation.
set autoindent

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

" Function for restoring cursor position.
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

" Extra features.
syntax on                       " Enable syntax highlighting.
set nocompatible                " Make Vim behave in a more useful way.
set nostartofline               " Keep cursor in the same column if possible.
set whichwrap=b,s,[,],<,>,h,l   " Allow cursor to wrap between lines.
set virtualedit=block           " Allow virtual editing in Visual block mode.
set lazyredraw                  " Don't redraw screen while executing macros/mappings.
set scrolloff=1                 " Minimal number of screen lines to keep above and below the cursor.
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
set foldmethod=indent           " Make Vim fold according to the indentation.
set mouse=n                     " Allow the mouse in normal mode.
" Using 'set background=dark' breaks some syntax - never use.

" Suffix-dependant autocommands.
autocmd BufNewFile,BufRead *.html let g:ragtag_global_maps = 1
autocmd BufNewFile,BufRead *.txt let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.txt set syntax=off
autocmd BufNewFile,BufRead *.eml let g:autoclose_loaded = 0
autocmd BufNewFile,BufRead *.hs set et
autocmd BufNewFile,BufRead *.rb set et sw=2 sts=2
autocmd BufNewFile,BufRead *.feature set et sw=2 sts=2

" Omnicompletion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Language Omnicompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo

" Textmate style invisible chars
set listchars=tab:▸\ ,eol:¬

" Use par as a formatter
set formatprg=par\ -w80

" Set Gist-plugin settings
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'firefox %URL% &'

let NERDSpaceDelims = 1        " Add spaces around the comment signs for all languages
let NERD_haskell_alt_style = 1 " Alt style looks better for Haskell (currently doesn't work)

" CTRL-P settings
let g:ctrlp_max_height = 25
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp.vim/cache'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_multi = '2v'
