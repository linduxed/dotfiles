-- Leader must be set before plugins are loaded, to ensure that the right
-- leader key is used when generating the mappings.
vim.g.mapleader = " "

-- Set up a :Browse command, to fix problem with :GBrowse complaining about
-- missing netrw. netrw is disabled by the nvim-tree plugin, and for some
-- reason vim-fugitive requires netrw to be loaded. A way around this problem
-- is to set a :Browse command. The command needs to be adjusted, depending on
-- the OS (Linux vs. OSX).
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    -- vim.fn.system { 'xdg-open', opts.fargs[1] }
    vim.fn.system { 'open', opts.fargs[1] }
  end,
  { nargs = 1 }
)

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

require("lazy").setup(
    "plugins",
    {
        change_detection = {
            -- automatically check for config file changes and reload the ui
            enabled = false,
            notify = false, -- get a notification when changes are found
        },
    }
)

vim.cmd.colorscheme("melange")

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

vim.opt.breakindent = true
vim.opt.breakindentopt = "list:-1"
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
vim.opt.listchars = "tab:▸ ,extends:❯,precedes:❮,trail:-,nbsp:∘,conceal:·"
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
