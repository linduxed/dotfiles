Plug 'vim-scripts/bbcode'
Plug 'mattn/calendar-vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/greplace.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'asins/mark'
Plug 'vim-scripts/matchit.zip'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/NrrwRgn'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/scratch.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'linduxed/undotree'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'tpope/vim-capslock'
Plug 'linduxed/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'jamessan/vim-gnupg'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-sayonara'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tbabej/taskwiki'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-wheel'
Plug 'guns/xterm-color-table.vim'
Plug 'michal-h21/vim-zettel'

" COC

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" Text objects

Plug 'kana/vim-textobj-indent'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/vim-textobj-url'
Plug 'kana/vim-textobj-user'

" Load after plugins that change mappings
Plug 'linduxed/colemak.vim'
