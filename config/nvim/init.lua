require("before_load_plugin_settings")

vim.cmd([[
call plug#begin()

source ~/.config/nvim/default_plugins.vim
source ~/.config/nvim/host_specific_plugins.vim

call plug#end()
]])

vim.g.PaperColor_Theme_Options = {
  theme = {
    ["default.dark"] = {
      override = {
        color00 = { "", "233" },
        folded_bg = { "", "17" },
        folded_fg = { "", "117" }
      }
    },
    ["default.light"] = {
      override = {
        color00 = { "", "255" },
        folded_bg = { "", "195" },
        folded_fg = { "", "31" }
      }
    }
  }
}

vim.cmd("colorscheme PaperColor")

vim.opt.colorcolumn = "+1"
vim.opt.completeopt = "menuone,preview,noinsert"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldmethod = "marker"
vim.opt.formatoptions = "qrn1t"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.iskeyword = vim.opt.iskeyword + "-"
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:∘"
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.showbreak = "…"
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 10
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc"
vim.opt.synmaxcol = 800
vim.opt.tabstop = 4
vim.opt.textwidth = 79
vim.opt.virtualedit = "block"
vim.opt.whichwrap = "b,s,[,],<,>,h,l"
vim.opt.wildignore = vim.opt.wildignore + ".hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.sw?,*.DS_Store,*.luac,migrations,*.pyc,*.orig"
vim.opt.wildmode = "list:longest,full"

vim.cmd([[
" {{{1 swap files

set directory=~/.config/nvim/tmp/swap//

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
]])

-- mappings.vim needs to be sourced after plugin_settings, otherwise some
-- plugin_settings get overwritten by mappings.vim.
require("plugin_settings")
require("mappings")
require("plugin_mappings")
