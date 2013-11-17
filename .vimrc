" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype indent plugin on

" {{{1 Colorscheme

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

" {{{1 Miscellaneous options

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set textwidth=79
set colorcolumn=+1
set shiftround
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set notimeout
set ttimeout
set ttimeoutlen=10
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoindent
set nostartofline
set formatoptions=qrn1t
set whichwrap=b,s,[,],<,>,h,l
set backspace=indent,eol,start
set iskeyword+=-
set virtualedit=block
set nojoinspaces
set lazyredraw
set cursorline
set cursorcolumn
set ruler
set showcmd
set showtabline=1
set laststatus=2
set number
set hidden
set mouse=n
set foldmethod=marker
set showbreak=…
set wildmenu
set history=50
set synmaxcol=800
set splitright
set autoread
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tags=./tags,./TAGS,tags,TAGS
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.sw?,*.DS_Store,*.luac,migrations,*.pyc,*.orig
let g:html_indent_tags = 'li\|p'
let g:netrw_liststyle = 3
let g:load_doxygen_syntax=1
au VimResized * :wincmd =

" {{{2 viminfo

"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,n~/.vim/viminfo

" {{{2 backups

set backup
set undofile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" {{{1 Sourcing

source ~/.vim/plugin_settings.vim
source ~/.vim/plugin_mappings.vim
source ~/.vim/mappings.vim
