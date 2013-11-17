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
let g:html_indent_tags = 'li\|p'
let g:netrw_liststyle = 3
au VimResized * :wincmd =

" {{{1 Sourcing

source ~/.vim/settings/syntax_coloring.vim
source ~/.vim/settings/foldtext.vim
source ~/.vim/settings/wildmenu.vim
source ~/.vim/settings/viminfo.vim
source ~/.vim/settings/backups.vim
source ~/.vim/plugin-settings/rainbow_parentheses.vim
source ~/.vim/plugin-settings/ctrlp.vim
source ~/.vim/plugin-settings/snipmate.vim
source ~/.vim/plugin-settings/nerd_commenter.vim
source ~/.vim/plugin-settings/gist.vim
source ~/.vim/plugin-settings/ack.vim
source ~/.vim/plugin-settings/syntastic.vim
source ~/.vim/plugin-settings/indent_guides.vim
source ~/.vim/plugin-settings/rspec.vim
source ~/.vim/plugin-settings/text_objects.vim
source ~/.vim/plugin-settings/airline.vim
source ~/.vim/plugin-settings/delimitmate.vim
source ~/.vim/plugin-settings/markdown.vim
source ~/.vim/autocommands/filetype_dependant.vim
source ~/.vim/autocommands/restore_cursor_position.vim
source ~/.vim/autocommands/misc.vim
source ~/.vim/mappings/trailing_whitespace.vim
source ~/.vim/mappings/highlight_whitespace.vim
source ~/.vim/mappings/visual_search.vim
source ~/.vim/mappings/search_and_jump.vim
source ~/.vim/mappings/selection_and_folds.vim
source ~/.vim/mappings/function_keys.vim
source ~/.vim/mappings/completion_menu.vim
source ~/.vim/mappings/misc.vim
source ~/.vim/mappings/fixed_width_formatting.vim
source ~/.vim/mappings/tab_switching.vim
source ~/.vim/plugin-mappings/easymotion.vim
source ~/.vim/plugin-mappings/ctrlp.vim
source ~/.vim/plugin-mappings/snipmate.vim
source ~/.vim/plugin-mappings/tabular.vim
source ~/.vim/plugin-mappings/indent_guides.vim
source ~/.vim/plugin-mappings/rspec.vim
source ~/.vim/plugin-mappings/text_objects.vim
