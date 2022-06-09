vim.cmd([[
call plug#begin()

source ~/.config/nvim/default_plugins.vim
source ~/.config/nvim/host_specific_plugins.vim

call plug#end()

" {{{1 Colorscheme

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'color00' : ['', '233'],
  \         'folded_bg' : ['', '17'],
  \         'folded_fg' : ['', '117']
  \       }
  \     },
  \     'default.light': {
  \       'override' : {
  \         'color00' : ['', '255'],
  \         'folded_fg' : ['', '31'],
  \         'folded_bg' : ['', '195']
  \       }
  \     }
  \   }
  \ }

colorscheme PaperColor

" {{{1 Miscellaneous options

let g:html_indent_tags = 'li\|p'
let g:load_doxygen_syntax=1
let g:netrw_liststyle = 3
set colorcolumn=+1
set completeopt=menuone,preview,noinsert
set cursorcolumn
set cursorline
set expandtab
set foldmethod=marker
set formatoptions=qrn1t
set ignorecase
set inccommand=nosplit
set iskeyword+=-
set lazyredraw
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:∘
set mouse=n
set number
set scrolloff=5
set shiftround
set shiftwidth=4
set showbreak=…
set showtabline=1
set sidescrolloff=10
set smartcase
set softtabstop=4
set splitright
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set synmaxcol=800
set tabstop=4
set textwidth=79
set virtualedit=block
set whichwrap=b,s,[,],<,>,h,l
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.sw?,*.DS_Store,*.luac,migrations,*.pyc,*.orig
set wildmode=list:longest,full

" {{{2 swap files

set directory=~/.config/nvim/tmp/swap//

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" {{{1 Sourcing

" mappings.vim needs to be sourced after plugin_settings, otherwise some
" plugin_settings get overwritten by mappings.vim.

source ~/.config/nvim/plugin_settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugin_mappings.vim
]])
