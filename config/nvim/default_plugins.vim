Plug 'gaoDean/autolist.nvim'
Plug 'wellle/context.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'Raimondi/delimitMate'
Plug 'wincent/ferret'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
Plug 'junegunn/goyo.vim'
Plug 'ggandor/leap.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/NrrwRgn'
Plug 'jose-elias-alvarez/null-ls.nvim' | Plug 'nvim-lua/plenary.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-scripts/scratch.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'folke/trouble.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'linduxed/undotree'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-grepper'
Plug 'plasticboy/vim-markdown'
Plug 'inkarkat/vim-mark' | Plug 'inkarkat/vim-ingo-library'
Plug 'tpope/vim-obsession'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-sayonara'
Plug 'honza/vim-snippets'
Plug 'monaqa/dial.nvim'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vista.vim'
Plug 'reedes/vim-wheel'
Plug 'guns/xterm-color-table.vim'

" Text objects

Plug 'kana/vim-textobj-indent'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/vim-textobj-url'
Plug 'kana/vim-textobj-user'

" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-git'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'

" Load after plugins that change mappings
Plug 'linduxed/colemak.vim'
