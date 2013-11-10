set autoindent
set nostartofline
set whichwrap=b,s,[,],<,>,h,l
set virtualedit=block
set lazyredraw
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set incsearch
set backspace=indent,eol,start
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
set iskeyword+=-
set history=50
set splitright
set shiftround
set autoread
set synmaxcol=800
set notimeout
set ttimeout
set ttimeoutlen=10
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tags=./tags,./TAGS,tags,TAGS
let g:html_indent_tags = 'li\|p'
let g:netrw_liststyle = 3
set colorcolumn=+1

au VimResized * :wincmd =
