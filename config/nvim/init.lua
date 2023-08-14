require("before_load_plugin_settings")

-- Leader must be set before plugins are loaded, to ensure that the right
-- leader key is used when generating the mappings.
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local wildignore = "" ..
    "*.DS_Store," ..
    "*.aux," ..
    "*.bmp," ..
    "*.dll," ..
    "*.exe," ..
    "*.gif," ..
    "*.jpeg," ..
    "*.jpg," ..
    "*.luac," ..
    "*.manifest," ..
    "*.o," ..
    "*.obj," ..
    "*.orig," ..
    "*.out," ..
    "*.png," ..
    "*.pyc," ..
    "*.spl," ..
    "*.sw?," ..
    "*.toc," ..
    ".git," ..
    ".hg," ..
    ".svn," ..
    "migrations"

local sessionoptions = "" ..
    "blank," ..
    "buffers," ..
    "curdir," ..
    "folds," ..
    "globals," ..
    "help," ..
    "localoptions," ..
    "options," ..
    "tabpages," ..
    "terminal," ..
    "winsize"

local suffixes = "" ..
    ".aux," ..
    ".bak," ..
    ".bbl," ..
    ".blg," ..
    ".brf," ..
    ".cb," ..
    ".dvi," ..
    ".idx," ..
    ".ilg," ..
    ".ind," ..
    ".info," ..
    ".inx," ..
    ".log," ..
    ".o," ..
    ".out," ..
    ".swp," ..
    ".toc," ..
    "~"

vim.opt.colorcolumn = "+1"
vim.opt.completeopt = "menu,menuone,preview,noinsert"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldmethod = "marker"
vim.opt.formatoptions = "qrn1t"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.iskeyword = vim.opt.iskeyword + "-"
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,extends:❯,precedes:❮,trail:-,nbsp:∘"
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.showbreak = "…"
vim.opt.showtabline = 1
vim.opt.sessionoptions = sessionoptions
vim.opt.sidescrolloff = 10
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.suffixes = suffixes
vim.opt.synmaxcol = 800
vim.opt.tabstop = 4
vim.opt.textwidth = 79
vim.opt.virtualedit = "block"
vim.opt.whichwrap = "b,s,[,],<,>,h,l"
vim.opt.wildignore = vim.opt.wildignore + wildignore
vim.opt.wildmode = "list:longest,full"
vim.opt.winbar = "%=%m %f%="

vim.cmd([[
" {{{1 swap files

set directory=~/.config/nvim/tmp/swap//

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
]])

require("mappings")
require("nvim-cmp")
require("lsp-configuration")
