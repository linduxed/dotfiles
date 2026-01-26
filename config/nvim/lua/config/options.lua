-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

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

vim.opt.breakindent = true
vim.opt.breakindentopt = "list:-1"
vim.opt.colorcolumn = "+1"
vim.opt.completeopt = "menu,menuone,preview,noinsert"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.iskeyword = vim.opt.iskeyword + "-"
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,extends:❯,precedes:❮,trail:-,nbsp:∘,conceal:·"
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.showbreak = "…"
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.suffixes = suffixes
vim.opt.synmaxcol = 800
vim.opt.tabstop = 8
vim.opt.textwidth = 79
vim.opt.whichwrap = "b,s,[,],<,>,h,l"
vim.opt.wildignore = vim.opt.wildignore + wildignore
vim.opt.winbar = "%=%m %f%="
