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
