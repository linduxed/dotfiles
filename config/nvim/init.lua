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

local function table_concat(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

local lazy_setup = {
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        init = function()
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
        end,
        config = function()
            vim.cmd("colorscheme PaperColor")
        end
    },
    {
        "linduxed/colemak.vim",
        -- Set to not be lazy, because I find it mentally easier to have it
        -- guaranteed that this plugin is loaded; it's hard for me to reason
        -- about the custom mappings of other plugins (commonly to account for
        -- the colemak.vim) if I'm not sure whether coleman.vim will have been
        -- loaded.
        lazy = false,
        -- Priority set to some arbitrary high number. If some other plugin
        -- has mappings that conflict with those of colemak.vim, that plugin
        -- will need to be set to `lazy = true` (haven't figured out another
        -- way) and set the priority to be _lower_ than that of this plugin, to
        -- ensure that the other plugin will apply its mappings _after_
        -- colemak.vim (higher priority means earlier load).
        priority = 100,
    },

    {
        "gaoDean/autolist.nvim",
        version = "~2.3",
        ft = {
            "markdown",
            "text",
        },
        config = function()
            local autolist = require("autolist")

            autolist.setup()
            autolist.create_mapping_hook("i", "<CR>", autolist.new)
            autolist.create_mapping_hook("i", "<C-T>", autolist.indent)
            autolist.create_mapping_hook("i", "<C-D>", autolist.indent)
            autolist.create_mapping_hook("n", "o", autolist.new)
            autolist.create_mapping_hook("n", "O", autolist.new_before)
            autolist.create_mapping_hook("n", ">>", autolist.indent)
            autolist.create_mapping_hook("n", "<<", autolist.indent)
            autolist.create_mapping_hook("n", "<Leader>blr", autolist.force_recalculate)
            autolist.create_mapping_hook("n", "<Leader>bli", autolist.invert_entry)
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup({
                toggler = {
                    line = '<leader>c<space>',
                    block = '<leader>cb',
                },
                -- LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    line = '<leader>c<space>',
                    block = '<leader>cb',
                },
                extra = {
                    above = '<leader>cO',
                    below = '<leader>co',
                    eol = '<leader>cT',
                },
                -- Enable keybindings
                mappings = {
                    -- Operator-pending mapping:
                    -- `<leader>cc`
                    -- `<leader>cb`
                    -- `<leader>c[count]{motion}`
                    -- `<leader>b[count]{motion}`
                    basic = true,
                    -- Extra mappings:
                    -- `<leader>cO`,
                    -- `<leader>co`,
                    -- `<leader>cT`
                    extra = false,
                },
            })
        end
    },
    "dyng/ctrlsf.vim",
    {
        "Raimondi/delimitMate",
        init = function()
            --  This is the default, but is included here for clarity:
            --  The coc.vim completion menu needs a <CR> mapping to work reliably.
            --  Therefore this should not be set to 1.
            vim.g.delimitMate_expand_cr = 0

            vim.g.delimitMate_expand_space = 1
            vim.g.delimitMate_jump_expansion = 1
        end,
    },
    {
        "wincent/ferret",
        -- This plugin is primarily added for the Quickfix listing
        -- enhancements. The other features are rarely used.

        init = function()
            vim.g.FerretMap = 0
            vim.g.FerretQFCommands = 0
        end
    },
    "Rawnly/gist.nvim",
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 80, -- width of the Zen window
                height = 0.95, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = false, -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    foldcolumn = "0", -- disable fold column
                    list = false, -- disable whitespace characters
                },
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false,  -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                },
                twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false }, -- disables the tmux statusline
            },
        },
        keys = {
            { "<Leader>go", "<cmd>ZenMode<CR>" }
        }
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").load({
                paths = os.getenv("HOME") .. "/.config/nvim/snippets"
            })

            require("luasnip").config.set_config({
                -- Tells LuaSnip to remember to keep around the last snippet.
                -- One can jump back into it even if you move outside of the selection.
                history = false,
                -- This allows dynamic snippets to update as one types.
                update_events = "TextChanged,TextChangedI",
            })

            -- Copied from the LuaSnip documentation
            vim.cmd([[
            " press <tab> to expand or jump in a snippet. these can also be mapped
            " separately " via <plug>luasnip-expand-snippet and <plug>luasnip-jump-next.
            imap <silent><expr> <tab> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : '<tab>'

            " -1 for jumping backwards.
            inoremap <silent> <s-tab> <cmd>lua require'luasnip'.jump(-1)<cr>

            snoremap <silent> <tab> <cmd>lua require('luasnip').jump(1)<cr>
            snoremap <silent> <s-tab> <cmd>lua require('luasnip').jump(-1)<cr>

            " for changing choices in choicenodes (not strictly necessary for a basic setup).
            imap <silent><expr> <c-e> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-e>'
            smap <silent><expr> <c-e> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-e>'
            ]])

            vim.keymap.set("n", "<leader>rse", function()
                require("luasnip.loaders").edit_snippet_files()
            end)
        end,
    },
    {
        "scrooloose/nerdtree",
        init = function()
            vim.g.NERDTreeQuitOnOpen = 1

            vim.g.NERDTreeMapOpenExpl = "y"
            vim.g.NERDTreeMapUpdir = "l"
            vim.g.NERDTreeMapUpdirKeepOpen = "L"
            vim.g.NERDTreeMapJumpFirstChild = "U"
            vim.g.NERDTreeMapJumpLastChild = "E"
            vim.g.NERDTreeMapJumpPrevSibling = "<C-u>"
            vim.g.NERDTreeMapJumpNextSibling = "<C-e>"
        end,
    },
    "chrisbra/NrrwRgn",
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- null_ls.builtins.diagnostics.credo,
                    null_ls.builtins.diagnostics.zsh,
                    -- null_ls.builtins.formatting.erlfmt,
                    null_ls.builtins.formatting.fnlfmt,
                    null_ls.builtins.formatting.jq,
                }
            })
        end
    },
    {
        "kevinhwang91/nvim-hlslens",
        -- Set to not be lazy to predictably override the mappings of
        -- colemak.vim, since the mappings for this plugin overlap for
        -- normal-mode `k` and `K`.
        lazy = false,
        -- Priority is set to be 1 less than colemak.vim, to ensure that
        -- colemak.vim gets loaded first, followed by this plugin, leading to
        -- `k` and `K` being overridden.
        priority = 99,
        config = function()
            require('hlslens').setup({
                calm_down = true,
            })
        end,
        keys = {
            { "k",  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
            { "K",  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
            { "*",  [[*<Cmd>lua require('hlslens').start()<CR>]] },
            { "#",  [[#<Cmd>lua require('hlslens').start()<CR>]] },
            { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]] },
            { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]] },
        }
    },
    "nvim-tree/nvim-web-devicons",
    "vim-scripts/scratch.vim",
    {
        "godlygeek/tabular",
        keys = {
            { "<Leader>ate", ":Tabularize / = /l0<CR>",     mode = "v" },
            { "<Leader>ate", ":Tabularize / = /l0<CR>",     mode = "n" },
            { "<Leader>atc", ":Tabularize /:\\zs/l0l1<CR>", mode = "v" },
            { "<Leader>atc", ":Tabularize /:\\zs/l0l1<CR>", mode = "n" },
        }
    },
    {
        "majutsushi/tagbar",
        init = function()
            vim.g.tagbar_type_elixir = {
                ctagstype = "elixir",
                kinds = {
                    "p:protocols",
                    "m:modules",
                    "e:exceptions",
                    "y:types",
                    "d:delegates",
                    "f:functions",
                    "c:callbacks",
                    "a:macros",
                    "t:tests",
                    "i:implementations",
                    "o:operators",
                    "r:records"
                },
                sro = ".",
                kind2scope = {
                    p = "protocol",
                    m = "module"
                },
                scope2kind = {
                    protocol = "p",
                    module = "m"
                },
                sort = 0
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && " ..
                    "cmake --build build --config Release && " ..
                    "cmake --install build --prefix build"
            }
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        layout_strategy = "vertical",
                    },
                },
            })

            require("telescope").load_extension("undo")
            require('telescope').load_extension('fzf')

            vim.cmd([[
            " Main mappings
            nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({follow = true})<cr>
            nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
            nnoremap <leader>fr <cmd>lua require('telescope.builtin').grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' })<cr>
            nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
            nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
            nnoremap <leader>fb <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
            nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
            nnoremap <leader>fap <cmd>lua require('telescope.builtin').builtin()<cr>

            " LSP mappings
            nnoremap <leader>alr <cmd>lua require('telescope.builtin').lsp_references()<cr>
            nnoremap <leader>ali <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
            ]])

            vim.keymap.set("n", "<F6>", "<cmd>Telescope undo<cr>")
        end,
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
        keys = {
            { "<Leader>ale", "<cmd>TroubleToggle<cr>" },
        },
    },
    "neovim/nvim-lspconfig",
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = true
    },
    "nvim-treesitter/playground",
    {
        "tpope/vim-abolish",
        -- Must be eagerly loaded, otherwise the Abolish definitions in the
        -- `abolish_save_file` are attempted to read without the plugin loaded,
        -- resulting in errors on startup.
        lazy = false,
        init = function()
            -- Turn of mappings, mostly to disable the Coerce functionality of
            -- the plugin.
            vim.g.abolish_no_mappings = 1
            vim.g.abolish_save_file =
            "/home/linduxed/.config/nvim/after/plugin/abolish.vim"
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            lazy = true
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "powerline_dark"
                }
            })
        end
    },
    "tpope/vim-capslock",
    {
        "chrisgrieser/nvim-genghis",
        -- dependencies = "stevearc/dressing.nvim"
    },
    {
        "tpope/vim-fugitive",
        dependencies = {
            "tpope/vim-rhubarb",
        },
        init = function()
            vim.g.fugitive_no_maps = 1
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,              -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,             -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false,          -- Toggle with `:Gitsigns toggle_word_diff`
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = ' <author>, <author_time:%Y-%m-%d> - <summary>',
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Text object
                    map({ 'o', 'x' }, 'rh', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end
    },
    {
        "plasticboy/vim-markdown",
        init = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_auto_insert_bullets = 0
            vim.g.vim_markdown_new_list_item_indent = 0
            vim.g.vim_markdown_no_default_key_mappings = 1
            vim.g.vim_markdown_conceal_code_blocks = 0
        end
    },
    {
        "inkarkat/vim-mark",
        dependencies = {
            "inkarkat/vim-ingo-library",
        },
        init = function()
            vim.g.mw_no_mappings = 1
            vim.g.mwDefaultHighlightingPalette = {
                { ctermbg = "Blue",        ctermfg = "Black" },
                { ctermbg = "Green",       ctermfg = "Black" },
                { ctermbg = "Yellow",      ctermfg = "Black" },
                { ctermbg = "DarkCyan",    ctermfg = "Black" },
                { ctermbg = "DarkBlue",    ctermfg = "Black" },
                { ctermbg = "DarkMagenta", ctermfg = "Black" },
                { ctermbg = "DarkRed",     ctermfg = "Black" },
                { ctermbg = "DarkGreen",   ctermfg = "Black" },
                { ctermbg = "Red",         ctermfg = "Black" },
                { ctermbg = "White",       ctermfg = "Gray" },
                { ctermbg = "LightGray",   ctermfg = "White" },
                { ctermbg = "Cyan",        ctermfg = "Black" },
                { ctermbg = "Brown",       ctermfg = "Black" }
            }
        end,
        keys = {
            { "<Leader>mm", "<Plug>MarkSet" },
            { "<Leader>mm", "<Plug>MarkSet",              mode = "x" },
            { "<Leader>mr", "<Plug>MarkRegex" },
            { "<Leader>mr", "<Plug>MarkRegex",            mode = "x" },
            { "<Leader>mt", "<Plug>MarkToggle" },
            { "<Leader>mx", "<Plug>MarkClear" },
            { "<Leader>mc", "<Plug>MarkAllClear" },
            { "<Leader>m*", "<Plug>MarkSearchCurrentNext" },
            { "<Leader>m#", "<Plug>MarkSearchCurrentPrev" },
            { "<Leader>m/", "<Plug>MarkSearchAnyNext" },
            { "<Leader>m?", "<Plug>MarkSearchAnyPrev" },
        },
    },
    "tpope/vim-obsession",
    "junegunn/vim-peekaboo",
    "tpope/vim-ragtag",
    {
        "mhinz/vim-sayonara",
        keys = {
            { "<leader>aq",  ":Sayonara<CR>" },
            { "<leader>abq", ":Sayonara!<CR>" },
        },
    },
    "honza/vim-snippets",
    {
        "monaqa/dial.nvim",
        config = function()
            vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal())
            vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal())
            vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual())
            vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual())
            vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual())
            vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual())

            local augend = require("dial.augend")
            require("dial.config").augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.alias.bool,
                    augend.date.alias["%Y-%m-%d"],
                    augend.date.alias["%H:%M"],
                    augend.case.new {
                        types = {
                            "snake_case",
                            "PascalCase",
                            "SCREAMING_SNAKE_CASE",
                            "camelCase",
                            "kebab-case",
                        },
                        cyclic = true,
                    },
                    augend.semver.alias.semver,
                }
            }
        end
    },
    {
        "kylechui/nvim-surround",
        -- Use for stability; omit to use `main` branch for the latest features
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "cs",
                    normal_cur = "css",
                    normal_line = "cS",
                    normal_cur_line = "cSS",
                    visual = "s",
                    visual_line = "gs",
                    delete = "ds",
                    change = "ws",
                },
                aliases = {
                    ["a"] = ">",
                    ["b"] = ")",
                    ["B"] = "}",
                    ["r"] = "]",
                    ["q"] = { '"', "'", "`" },
                    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
                },
            })
        end
    },
    {
        "machakann/vim-swap",
        init = function()
            vim.g.swap_no_default_key_mappings = 1
        end,
        config = function()
            vim.keymap.set({ "n" }, "g<", "<Plug>(swap-prev)")
            vim.keymap.set({ "n" }, "g>", "<Plug>(swap-next)")
            vim.keymap.set({ "n", "x" }, "gm", "<Plug>(swap-interactive)")
        end
    },
    {
        "Tummetott/unimpaired.nvim",
        config = function()
            require('unimpaired').setup({
                -- Copying in entire default configuration to modify it.
                default_keymaps = false,
                keymaps = {
                    previous = {
                        mapping = '[a',
                        description = 'Jump to [count] previous file in arglist',
                        dot_repeat = false
                    },
                    next = {
                        mapping = ']a',
                        description = 'Jump to [count] next file in arglist',
                        dot_repeat = false,
                    },
                    first = {
                        mapping = '[A',
                        description = 'Jump to first file in arglist',
                        dot_repeat = false,
                    },
                    last = {
                        mapping = ']A',
                        description = 'Jump to last file in arglist',
                        dot_repeat = false,
                    },
                    bprevious = {
                        mapping = '[b',
                        description = 'Jump to [count] previous buffer',
                        dot_repeat = false,
                    },
                    bnext = {
                        mapping = ']b',
                        description = 'Jump to [count] next buffer',
                        dot_repeat = false,
                    },
                    bfirst = {
                        mapping = '[B',
                        description = 'Jump to first buffer',
                        dot_repeat = false,
                    },
                    blast = {
                        mapping = ']B',
                        description = 'Jump to last buffer',
                        dot_repeat = false,
                    },
                    lprevious = {
                        mapping = '[l',
                        description = 'Jump to [count] previous entry in loclist',
                        dot_repeat = false,
                    },
                    lnext = {
                        mapping = ']l',
                        description = 'Jump to [count] next entry in loclist',
                        dot_repeat = false,
                    },
                    lfirst = {
                        mapping = '[L',
                        description = 'Jump to first entry in loclist',
                        dot_repeat = false,
                    },
                    llast = {
                        mapping = ']L',
                        description = 'Jump to last entry in loclist',
                        dot_repeat = false,
                    },
                    lpfile = {
                        mapping = '[<C-l>',
                        description = 'Jump to last entry of [count] previous file in loclist',
                        dot_repeat = false,
                    },
                    lnfile = {
                        mapping = ']<C-l>',
                        description = 'Jump to first entry of [count] next file in loclist',
                        dot_repeat = false,
                    },
                    cprevious = {
                        mapping = '[q',
                        description = 'Jump to [count] previous entry in qflist',
                        dot_repeat = false,
                    },
                    cnext = {
                        mapping = ']q',
                        description = 'Jump to [count] next entry in qflist',
                        dot_repeat = false,
                    },
                    cfirst = {
                        mapping = '[Q',
                        description = 'Jump to first entry in qflist',
                        dot_repeat = false,
                    },
                    clast = {
                        mapping = ']Q',
                        description = 'Jump to last entry in qflist',
                        dot_repeat = false,
                    },
                    cpfile = {
                        mapping = '[<C-q>',
                        description = 'Jump to last entry of [count] previous file in qflist',
                        dot_repeat = false,
                    },
                    cnfile = {
                        mapping = ']<C-q>',
                        description = 'Jump to first entry of [count] next file in qflist',
                        dot_repeat = false,
                    },
                    tprevious = false,
                    tnext = false,
                    tfirst = false,
                    tlast = false,
                    ptprevious = false,
                    ptnext = false,
                    previous_file = false,
                    next_file = {
                        mapping = ']f',
                        description = 'Next file in directory. :cnewer in qflist',
                        dot_repeat = false,
                    },
                    blank_above = {
                        mapping = '[<Space>',
                        description = 'Add [count] blank lines above',
                        dot_repeat = true,
                    },
                    blank_below = {
                        mapping = ']<Space>',
                        description = 'Add [count] blank lines below',
                        dot_repeat = true,
                    },
                    exchange_above = {
                        mapping = '[e',
                        description = 'Exchange line with [count] lines above',
                        dot_repeat = true,
                    },
                    exchange_below = {
                        mapping = ']e',
                        description = 'Exchange line with [count] lines below',
                        dot_repeat = true,
                    },
                    exchange_section_above = {
                        mapping = '[e',
                        description = 'Move section [count] lines up',
                        dot_repeat = true,
                    },
                    exchange_section_below = {
                        mapping = ']e',
                        description = 'Move section [count] lines down',
                        dot_repeat = true,
                    },
                    enable_diff = false,
                    disable_diff = false,
                    toggle_diff = {
                        mapping = 'cod',
                        description = 'Toggle diff',
                        dot_repeat = false,
                    },
                    enable_hlsearch = false,
                    disable_hlsearch = false,
                    toggle_hlsearch = false,
                    enable_ignorecase = false,
                    disable_ignorecase = false,
                    toggle_ignorecase = false,
                    enable_list = false,
                    disable_list = false,
                    toggle_list = {
                        mapping = 'col',
                        description = 'Toggle invisible characters (listchars)',
                        dot_repeat = false,
                    },
                    enable_number = false,
                    disable_number = false,
                    toggle_number = {
                        mapping = 'con',
                        description = 'Toggle line numbers',
                        dot_repeat = false,
                    },
                    enable_relativenumber = false,
                    disable_relativenumber = false,
                    toggle_relativenumber = {
                        mapping = 'cor',
                        description = 'Toggle relative numbers',
                        dot_repeat = false,
                    },
                    enable_spell = false,
                    disable_spell = false,
                    toggle_spell = {
                        mapping = 'cos',
                        description = 'Toggle spell check',
                        dot_repeat = false,
                    },
                    enable_background = false,
                    disable_background = false,
                    toggle_background = {
                        mapping = 'cob',
                        description = 'Toggle background',
                        dot_repeat = false,
                    },
                    enable_cursorline = false,
                    disable_cursorline = false,
                    toggle_cursorline = false,
                    enable_cursorcolumn = false,
                    disable_cursorcolumn = false,
                    toggle_cursorcolumn = false,
                    enable_virtualedit = false,
                    disable_virtualedit = false,
                    toggle_virtualedit = {
                        mapping = 'cov',
                        description = 'Toggle virtualedit',
                        dot_repeat = false,
                    },
                    enable_wrap = false,
                    disable_wrap = false,
                    toggle_wrap = {
                        mapping = 'cow',
                        description = 'Toggle line wrapping',
                        dot_repeat = false,
                    },
                    enable_cursorcross = false,
                    disable_cursorcross = false,
                    toggle_cursorcross = {
                        mapping = 'cox',
                        description = 'Toggle cursorcross',
                        dot_repeat = false,
                    },
                },
            })
        end
    },
    "sheerun/vim-polyglot",
    {
        "liuchengxu/vista.vim",
        init = function()
            vim.g.vista_icon_indent = { "↳ ", "↦ " }
        end
    },
    {
        "reedes/vim-wheel",
        init = function()
            -- Disable for mouse, due to erratic behavior.
            vim.g["wheel#map#mouse"] = 0

            vim.g["wheel#map#up"]    = "U"
            vim.g["wheel#map#down"]  = "E"
        end
    },
    "guns/xterm-color-table.vim",
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup({
                -- Id is automatically added at the beginning, and name at the end
                -- See :help oil-columns
                columns = {
                    "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`
                default_file_explorer = true,
                -- Skip the confirmation popup for simple operations
                skip_confirm_for_simple_edits = false,
            })
        end
    },
    {
        'kiran94/edit-markdown-table.nvim',
        config = function()
            require('edit-markdown-table').setup()
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "EditMarkdownTable",
    },
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = { "BufReadPre " .. vim.fn.expand "~" .. "/vimwiki/**.md" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            dir = "~/vimwiki",
            notes_subdir = "notes",
            daily_notes = {
                folder = "diary",
            },
            completion = {
                nvim_cmp = true,
            },

            -- Disable frontmatter handling, since I don't fully understand all
            -- the things that the plugin does with the frontmatter.
            disable_frontmatter = true,

            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,

            -- Optional, alternatively you can customize the frontmatter data.
            note_frontmatter_func = function(note)
                -- This is equivalent to the default frontmatter function.
                local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,

            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },
            follow_url_func = function(url)
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end,
            -- Optional, set to true if you use the Obsidian Advanced URI plugin.
            use_advanced_uri = false,
            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,
        },
        config = function(_, opts)
            require("obsidian").setup(opts)

            vim.keymap.set("n", "gf", function()
                if require("obsidian").util.cursor_on_markdown_link() then
                    return "<cmd>ObsidianFollowLink<CR>"
                else
                    return "gf"
                end
            end, { noremap = false, expr = true })
        end,
    },
    {
        'antonk52/markdowny.nvim',
        config = function()
            require('markdowny').setup()
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            labels = "arstoienhdwfpyulgjqzxcvmkb",
            modes = {
                -- options used when flash is activated through
                -- `f`, `F`, `t`, `T`, `;` and `,` motions
                char = {
                    enabled = false,
                },
            },
        },
        keys = {
            {
                "gl",
                mode = { "n", "x", "o" },
                function()
                    -- default options:
                    -- exact mode, multi window, all directions, with a backdrop
                    require("flash").jump()
                end,
            },
            {
                "gy",
                mode = { "n", "x", "o" },
                function()
                    -- default options:
                    -- exact mode, multi window, all directions, with a backdrop
                    require("flash").jump()
                end,
            },
            {
                "gt",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter()
                end,
            },
        },
    },
    'kosayoda/nvim-lightbulb',
    {
        'winston0410/range-highlight.nvim',
        dependencies = {
            'winston0410/cmd-parser.nvim'
        },
        config = function()
            require('range-highlight').setup({})
        end,
    },
    {
        "gbprod/cutlass.nvim",
        -- Set to not be lazy to predictably override the mappings of
        -- colemak.vim, since the mappings for this plugin overlap for
        -- every key that this plugin touches.
        lazy = false,
        -- Priority is set to be 1 less than colemak.vim, to ensure that
        -- colemak.vim gets loaded first, followed by this plugin, leading to
        -- `k` and `K` being overridden.
        priority = 99,
        opts = {
            cut_key = "x",
            override_del = true,
            exclude = {},
            registers = {
                select = "_",
                delete = "_",
                change = "_",
            },
        }
    },
    {
        "sindrets/winshift.nvim",
        keys = {
            -- Start Win-Move mode:
            { "<C-W><C-M>", "<Cmd>WinShift<CR>",      mode = "n" },
            { "<C-W>m",     "<Cmd>WinShift<CR>",      mode = "n" },

            -- Swap two windows:
            { "<C-W>X",     "<Cmd>WinShift swap<CR>", mode = "n" },
        },
    },

    -- Text objects
    {
        "kana/vim-textobj-indent",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.vim.
        init = function()
            vim.g.textobj_indent_no_default_key_mappings = 1
        end,
        keys = {
            { "ti", "<Plug>(textobj-indent-a)", mode = "x" },
            { "ti", "<Plug>(textobj-indent-a)", mode = "o" },
            { "ri", "<Plug>(textobj-indent-i)", mode = "x" },
            { "ri", "<Plug>(textobj-indent-i)", mode = "o" },
        }
    },
    {
        "saihoooooooo/vim-textobj-space",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.vim.
        init = function()
            vim.g.textobj_space_no_default_key_mappings = 1
        end,
        keys = {
            { "tS", "<Plug>(textobj-space-a)", mode = "x" },
            { "tS", "<Plug>(textobj-space-a)", mode = "o" },
            { "rS", "<Plug>(textobj-space-i)", mode = "x" },
            { "rS", "<Plug>(textobj-space-i)", mode = "o" },
        }
    },
    {
        "lucapette/vim-textobj-underscore",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.vim.
        init = function()
            vim.g.textobj_underscore_no_default_key_mappings = 1
        end,
        keys = {
            { "t_", "<Plug>(textobj-underscore-a)", mode = "x" },
            { "t_", "<Plug>(textobj-underscore-a)", mode = "o" },
            { "r_", "<Plug>(textobj-underscore-i)", mode = "x" },
            { "r_", "<Plug>(textobj-underscore-i)", mode = "o" },
        }
    },
    {
        "mattn/vim-textobj-url",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.vim.
        init = function()
            vim.g.textobj_url_no_default_key_mappings = 1
        end,
        keys = {
            { "tu", "<Plug>(textobj-url-a)", mode = "x" },
            { "tu", "<Plug>(textobj-url-a)", mode = "o" },
            { "ru", "<Plug>(textobj-url-i)", mode = "x" },
            { "ru", "<Plug>(textobj-url-i)", mode = "o" },
        }
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-git",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        }
    },
}

local host_specific_plugins = require("host_specific_plugins")

local lazy_setup_with_host_specific_plugins =
    table_concat(lazy_setup, host_specific_plugins)

require("lazy").setup(lazy_setup_with_host_specific_plugins)

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
