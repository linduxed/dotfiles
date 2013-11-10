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
