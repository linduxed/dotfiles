" {{{1 Plugins

call plug#begin()

source ~/.config/nvim/default_plugins.vim
source ~/.config/nvim/host_specific_plugins.vim

call plug#end()

" {{{1 Colorscheme

syntax on
set background=dark

set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1
let g:solarized_degrade    = 0
let g:solarized_bold       = 1
let g:solarized_underline  = 1
let g:solarized_italic     = 1
let g:solarized_contrast   = "normal"
let g:solarized_visibility = "normal"

colorscheme solar_linduxed

" {{{1 Miscellaneous options

set inccommand=nosplit
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
set ignorecase
set smartcase
set nostartofline
set formatoptions=qrn1t
set whichwrap=b,s,[,],<,>,h,l
set iskeyword+=-
set virtualedit=block
set nojoinspaces
set lazyredraw
set cursorline
set cursorcolumn
set ruler
set showcmd
set showtabline=1
set number
set hidden
set mouse=n
set foldmethod=marker
set showbreak=…
set synmaxcol=800
set splitright
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview,noinsert
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:∘
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
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
set viminfo='10,\"100,:20

" {{{2 backups

set backup
set undofile

set undodir=~/.config/nvim/tmp/undo//
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//

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

" mappings.vim needs to be sourced after plugin_settings, otherwise some
" plugin_settings get overwritten by mappings.vim.

source ~/.config/nvim/plugin_settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugin_mappings.vim
