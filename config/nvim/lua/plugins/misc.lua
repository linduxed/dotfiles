return {
    {
        'numToStr/Comment.nvim',
        enabled = true,
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
    {
        "dyng/ctrlsf.vim",
        enabled = true,
        lazy = false,
        init = function()
            vim.g.ctrlsf_populate_qflist = 1
            vim.g.ctrlsf_backend = "rg"
        end,
        keys = {
            {
                "<Leader>sp",
                "<Plug>CtrlSFPrompt",
                mode = "n",
                desc = "CtrlSF - Bare prompt"
            },
            {
                "<Leader>sc",
                "<Plug>CtrlSFCwordPath",
                mode = "n",
                desc = "CtrlSF - Word under cursor"
            },
            {
                "<Leader>sb",
                "<Plug>CtrlSFCCwordPath",
                mode = "n",
                desc = "CtrlSF - Word (and boundary) under cursor"
            },
            {
                "<Leader>sl",
                "<Plug>CtrlSFPwordPath",
                mode = "n",
                desc = "CtrlSF - Last search pattern"
            },
            {
                "<Leader>swf",
                "<cmd>CtrlSFFocus<cr>",
                mode = "n",
                desc = "CtrlSF - Focus"
            },
            {
                "<Leader>swt",
                "<cmd>CtrlSFToggle<cr>",
                mode = "n",
                desc = "CtrlSF - Toggle"
            },
            {
                "<Leader>swu",
                "<cmd>CtrlSFUpdate<cr>",
                mode = "n",
                desc = "CtrlSF - Update (run same search)"
            },
            {
                "<Leader>sc",
                "<Plug>CtrlSFVwordExec",
                mode = "v",
                desc = "CtrlSF - Search highlighted"
            },
            {
                "<Leader>sp",
                "<Plug>CtrlSFVwordPath",
                mode = "v",
                desc = "CtrlSF - Open prompt with highlighted"
            },
        }
    },
    {
        "Raimondi/delimitMate",
        enabled = true,
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
        enabled = true,
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
        enabled = true,
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 80,    -- width of the Zen window
                height = 0.95, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    signcolumn = "no",      -- disable signcolumn
                    number = false,         -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false,     -- disable cursorline
                    cursorcolumn = false,   -- disable cursor column
                    foldcolumn = "0",       -- disable fold column
                    list = false,           -- disable whitespace characters
                },
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false,              -- disables the ruler text in the cmd line area
                    showcmd = false,            -- disables the command in the last line of the screen
                },
                twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false },     -- disables the tmux statusline
            },
        },
        keys = {
            {
                "<Leader>z",
                function() require("zen-mode").toggle() end,
                desc = "ZenMode"
            }
        }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = true,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- Close Neo-tree if it is the last window left in the tab
            close_if_last_window = false,
            -- used when sorting files and directories in the tree
            sort_case_insensitive = false,
            window = {
                position = "left",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["<space>"] = {
                        "toggle_node",
                        -- disable `nowait` if you have existing combos
                        -- starting with this char that you want to use
                        nowait = true,
                    },
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    -- close preview or floating neo-tree window
                    ["<esc>"] = "cancel",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["l"] = "focus_preview",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    -- ["S"] = "split_with_window_picker",
                    -- ["s"] = "vsplit_with_window_picker",
                    ["t"] = "open_tabnew",
                    -- ["<cr>"] = "open_drop",
                    -- ["t"] = "open_tab_drop",
                    ["w"] = "open_with_window_picker",
                    -- enter preview mode, which shows the current node
                    -- without focusing
                    --["P"] = "toggle_preview",
                    ["C"] = "close_node",
                    -- ['C'] = 'close_all_subnodes',
                    ["z"] = "close_all_nodes",
                    --["Z"] = "expand_all_nodes",
                    ["a"] = {
                        -- this command supports BASH style brace expansion
                        -- ("x{a,b,c}" -> xa,xb,xc).
                        -- see `:h neo-tree-file-actions` for details.
                        "add",
                        -- some commands may take optional config options,
                        -- see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none" -- "none", "relative", "absolute"
                        }
                    },
                    -- also accepts the optional config.show_path option like
                    -- "add". this also supports BASH style brace expansion.
                    ["A"] = "add_directory",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    -- takes text input for destination, also accepts the
                    -- optional config.show_path option like "add":
                    ["c"] = "copy",
                    -- ["c"] = {
                    --  "copy",
                    --  config = {
                    --    show_path = "none" -- "none", "relative", "absolute"
                    --  }
                    --}
                    -- takes text input for destination, also accepts the
                    -- optional config.show_path option like "add".
                    ["m"] = "move",
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                }
            },
            nesting_rules = {},
            filesystem = {
                hijack_netrw_behavior = "disabled",
                filtered_items = {
                    -- when true, they will just be displayed differently than
                    -- normal items
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_by_name = {
                        --"node_modules"
                    },
                    -- uses glob style patterns
                    hide_by_pattern = {
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    -- remains visible even if other settings would normally
                    -- hide it
                    always_show = {
                        --".gitignored",
                    },
                    -- remains hidden even if visible is toggled to true,
                    -- this overrides always_show
                    never_show = {
                        --".DS_Store",
                        --"thumbs.db"
                    },
                    -- uses glob style patterns
                    never_show_by_pattern = {
                        --".null-ls_*",
                    },
                },
            },
            buffers = {
                follow_current_file = {
                    -- netrw disabled, opening a directory opens within the
                    -- window like netrw would, regardless of window.position
                    enabled = true,
                    -- `false` closes auto expanded dirs, such as
                    -- with `:Neotree reveal`
                    leave_dirs_open = false,
                },
                -- when true, empty folders will be grouped together
                group_empty_dirs = true,
                show_unloaded = true,
                window = {
                    mappings = {
                        ["bd"] = "buffer_delete",
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                    }
                },
            },
            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["A"]  = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                    }
                }
            }
        }
    },
    {
        "chrisbra/NrrwRgn",
        enabled = true,
        init = function()
            vim.g.nrrw_rgn_nomap_nr = 1
            vim.g.nrrw_rgn_nomap_Nr = 1
        end
    },
    {
        "kevinhwang91/nvim-hlslens",
        enabled = true,
        config = function()
            require('hlslens').setup({
                calm_down = true,
            })
        end,
        keys = {
            { "n",  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
            { "N",  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
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
        enabled = true,
        keys = {
            {
                "<Leader>aae",
                ":Tabularize / = /l0<CR>",
                mode = "v",
                desc = "Tabularize - Equals"
            },
            {
                "<Leader>aae",
                ":Tabularize / = /l0<CR>",
                mode = "n",
                desc = "Tabularize - Equals"
            },
            {
                "<Leader>aac",
                ":Tabularize /:\\zs/l0l1<CR>",
                mode = "v",
                desc = "Tabularize - Whitespace after colon"
            },
            {
                "<Leader>aac",
                ":Tabularize /:\\zs/l0l1<CR>",
                mode = "n",
                desc = "Tabularize - Whitespace after colon"
            },
        }
    },
    {
        "folke/trouble.nvim",
        enabled = true,
        config = function()
            require("trouble").setup({})
        end,
        keys = {
            {
                "<leader>ard",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>arg",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>ars",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>arr",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>arl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>arq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "tpope/vim-abolish",
        enabled = true,
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
        enabled = true,
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
        enabled = true,
        -- dependencies = "stevearc/dressing.nvim"
        config = function()
            -- running this only to initialize the plugin, as it seems like
            -- it's not being loaded properly.
            require("genghis").setup({})
        end
    },
    {
        "plasticboy/vim-markdown",
        enabled = true,
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
        enabled = true,
        dependencies = {
            "inkarkat/vim-ingo-library",
        },
        init = function()
            vim.g.mw_no_mappings = 1
            vim.g.mwDefaultHighlightingPalette = 'extended'
        end,
        keys = {
            {
                "<Leader>mm",
                "<Plug>MarkSet",
                desc = "Mark - Word under cursor"
            },
            {
                "<Leader>mm",
                "<Plug>MarkSet",
                mode = "x",
                desc = "Mark - Selected"
            },
            {
                "<Leader>mr",
                "<Plug>MarkRegex",
                desc = "Mark - Regex"
            },
            {
                "<Leader>mr",
                "<Plug>MarkRegex",
                mode = "x",
                desc = "Mark - Regex"
            },
            {
                "<Leader>mt",
                "<Plug>MarkToggle",
                desc = "Mark - Toggle all highlights"
            },
            {
                "<Leader>mx",
                "<Plug>MarkClear",
                desc = "Mark - Remove highlight under cursor"
            },
            {
                "<Leader>mc",
                "<Plug>MarkAllClear",
                desc = "Mark - Remove all highlights"
            },
            {
                "<Leader>m*",
                "<Plug>MarkSearchCurrentNext",
                desc = "Mark - Jump to next instance of current"
            },
            {
                "<Leader>m#",
                "<Plug>MarkSearchCurrentPrev",
                desc = "Mark - Jump to previous instance of current"
            },
            {
                "<Leader>m/",
                "<Plug>MarkSearchAnyNext",
                desc = "Mark - Jump to next highlight (any)"
            },
            {
                "<Leader>m?",
                "<Plug>MarkSearchAnyPrev",
                desc = "Mark - Jump to previous highlight (any)"
            },
        },
    },
    "tpope/vim-ragtag",
    {
        "mhinz/vim-sayonara",
        enabled = true,
        keys = {
            {
                "<leader>aqh",
                ":Sayonara<CR>",
                desc = "Sayonara - Hard (affects window layout)"
            },
            {
                "<leader>aqs",
                ":Sayonara!<CR>",
                desc = "Sayonara - Soft (retains window layout)"
            },
        },
    },
    {
        "monaqa/dial.nvim",
        enabled = true,
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
                    augend.constant.new({
                        elements = { "True", "False" },
                        word = true,
                        cyclic = true,
                    }),
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
        enabled = true,
        -- Use for stability; omit to use `main` branch for the latest features
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>z",
                    insert_line = "<C-g>Z",
                    normal = "yz",
                    normal_cur = "yzz",
                    normal_line = "yZ",
                    normal_cur_line = "yZZ",
                    visual = "Z",
                    visual_line = "gZ",
                    delete = "dz",
                    change = "cz",
                    change_line = "cZ",
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
        enabled = true,
    },
    {
        "Tummetott/unimpaired.nvim",
        enabled = true,
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
                    previous_file = {
                        mapping = '[f',
                        description = 'Previous file in directory. :colder in qflist',
                        dot_repeat = true,
                    },
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
    {
        "sheerun/vim-polyglot",
        enabled = true,
        init = function()
            vim.g.polyglot_disabled = { "csv", "markdown", "text" }
        end
    },
    {
        "liuchengxu/vista.vim",
        enabled = true,
        init = function()
            vim.g.vista_icon_indent = { "↳ ", "↦ " }
            vim.g.vista_default_executive = "nvim_lsp"
            vim.g.vista_sidebar_width = 60
        end
    },
    {
        "hedyhli/outline.nvim",
        enabled = true,
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            {
                "<F9>",
                "<cmd>OutlineFocus<CR>",
                desc = "Focus outline",
            },
            {
                "<F10>",
                "<cmd>Outline<CR>",
                desc = "Toggle outline",
            },
        },
        opts = {
            outline_window = {
                width = 60,
                relative_width = false,
                focus_on_open = false,
            },

            preview_window = {
                width = 50,      -- Percentage or integer of columns
                min_width = 50,  -- Minimum number of columns
                relative_width = true,
                height = 50,     -- Percentage or integer of lines
                min_height = 10, -- Minimum number of lines
                relative_height = true,
                border = 'double',
                live = true
            },

            -- These keymaps can be a string or a table for multiple keys.
            -- Set to `{}` to disable. (Using 'nil' will fallback to default keys)
            keymaps = {
                show_help = '?',
                close = { '<Esc>', 'q' },
                -- Jump to symbol under cursor.
                -- It can auto close the outline window when triggered, see
                -- 'auto_close' option above.
                goto_location = '<CR>',
                -- Jump to symbol under cursor but keep focus on outline window.
                peek_location = 'o',
                -- Visit location in code and close outline immediately
                goto_and_close = '<S-CR>',
                -- Change cursor position of outline window to match current location in code.
                -- 'Opposite' of goto/peek_location.
                restore_location = '<C-g>',
                -- Open LSP/provider-dependent symbol hover information
                hover_symbol = '<C-space>',
                -- Preview location code of the symbol under cursor
                toggle_preview = 'M',
                rename_symbol = 'r',
                code_actions = 'a',
                -- These fold actions are collapsing tree nodes, not code folding
                fold = 'h',
                unfold = 'l',
                fold_toggle = '<Tab>',
                -- Toggle folds for all nodes.
                -- If at least one node is folded, this action will fold all nodes.
                -- If all nodes are folded, this action will unfold all nodes.
                fold_toggle_all = '<S-Tab>',
                fold_all = 'W',
                unfold_all = 'E',
                fold_reset = 'R',
                -- Move down/up by one line and peek_location immediately.
                -- You can also use outline_window.auto_jump=true to do this for any
                -- j/k/<down>/<up>.
                down_and_jump = '<C-j>',
                up_and_jump = '<C-k>',
            },

        },
    },
    "guns/xterm-color-table.vim",
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        cmd = "Copilot",
        config = function()
            require("copilot").setup({})
        end,
    },
    {
        'stevearc/oil.nvim',
        enabled = true,
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
        enabled = true,
        config = function()
            require('edit-markdown-table').setup()
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "EditMarkdownTable",
    },
    {
        "epwalsh/obsidian.nvim",
        enabled = true,
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
                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                new_notes_location = "notes_subdir",
            },

            -- Default configuration only has one mapping: "gf", for navigation
            -- of markdown links. This is functionality that I want, but
            -- the mapping can't be set the normal way (by setting it through
            -- `mappings` below), due to an interaction between `obsidian.nvim`
            -- and `which-key.nvim`.
            --
            -- For `which-key.nvim` to work for various normal-mode mappings
            -- that *start* with "g", it needs to set normal-mode "g" to opening
            -- its menu for "g". Apparently `obsidian.nvim` does not like that,
            -- as it seems to want a completely clear mapping of both
            -- normal-mode "g" and "gf" (presuming that's the mapping one wants).
            --
            -- As a solution to this, set the mappings to an empty table, and
            -- then set the mapping manually in the `config` of the plugin.
            mappings = {},

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

            vim.opt.conceallevel = 2
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
        enabled = true,
        config = function()
            require('markdowny').setup()
        end
    },
    {
        "folke/flash.nvim",
        enabled = true,
        event = "VeryLazy",
        opts = {
            labels = "arstoienhdwfpyulgjqzxcvmkb",
        },
        keys = {
            {
                "s",
                mode = { "n", "o", "x" },
                function() require("flash").jump() end,
                desc = "Flash - Jump"
            },
            {
                "r",
                mode = { "o" },
                function() require("flash").remote() end,
                desc = "Flash - Remote operation (o-mode)"
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc = "Flash - Treesitter jump"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Flash - Treesitter search (o- and x-mode)"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc = "Flash - Toggle flash search (command-mode)"
            },
        },
    },
    'kosayoda/nvim-lightbulb',
    {
        "gbprod/cutlass.nvim",
        enabled = true,
        opts = {
            cut_key = "x",
            override_del = true,
            exclude = {
                "s<space>",
            },
            registers = {
                select = "_",
                delete = "_",
                change = "_",
            },
        }
    },
    {
        "sindrets/winshift.nvim",
        enabled = true,
        keys = {
            -- Start Win-Move mode:
            { "<C-W><C-M>", "<Cmd>WinShift<CR>",      mode = "n" },
            { "<C-W>m",     "<Cmd>WinShift<CR>",      mode = "n" },

            -- Swap two windows:
            { "<C-W>X",     "<Cmd>WinShift swap<CR>", mode = "n" },
        },
    },
    {
        "sedm0784/vim-you-autocorrect",
        enabled = true,
        lazy = false,
        keys = {
            {
                "<Leader>asce",
                "<Cmd>EnableAutocorrect<CR>",
                mode = "n",
                desc = "Autocorrect - Enable"
            },
            {
                "<Leader>ascd",
                "<Cmd>DisableAutocorrect<CR>",
                mode = "n",
                desc = "Autocorrect - Disable"
            },
            {
                "<F7>",
                "<C-O><Plug>VimyouautocorrectUndo",
                mode = "i",
                desc = "Autocorrect - Undo latest"
            },
            {
                "<Leader>ascu",
                "<Plug>VimyouautocorrectUndo",
                mode = "n",
                desc = "Autocorrect - Undo latest"
            },
            {
                "<F8>",
                "<C-O><Plug>VimyouautocorrectNext",
                mode = "i",
                desc = "Autocorrect - Next suggested correction"
            },
            {
                "<Leader>ascn",
                "<Plug>VimyouautocorrectJump",
                mode = "n",
                desc = "Autocorrect - Next suggested correction"
            },
            {
                "<F9>",
                "<C-O><Plug>VimyouautocorrectPrevious",
                mode = "i",
                desc = "Autocorrect - Previous suggested correction"
            },
            {
                "<Leader>ascp",
                "<Plug>VimyouautocorrectPrevious",
                mode = "n",
                desc = "Autocorrect - Previous suggested correction"
            },
            {
                "<F10>",
                "<C-O><Plug>VimyouautocorrectJump",
                mode = "i",
                desc = "Autocorrect - Jump to latest"
            },
            {
                "<Leader>ascj",
                "<Plug>VimyouautocorrectJump",
                mode = "n",
                desc = "Autocorrect - Jump to latest"
            },
        }
    },
    {
        "RaafatTurki/hex.nvim",
        enabled = true,
        config = function()
            require("hex").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        main = "ibl",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        enabled = true,
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
        },
        opts = {},
        keys = {
            {
                "<Leader>bxq",
                "<cmd>TodoQuickFix<cr>",
                mode = "n",
                desc = "TODO - QuickFix list"
            },
            {
                "<Leader>bxl",
                "<cmd>TodoLocList<cr>",
                mode = "n",
                desc = "TODO - Location list"
            },
            {
                "<Leader>bxe",
                "<cmd>TodoTrouble<cr>",
                mode = "n",
                desc = "TODO - Trouble window"
            },
            {
                "<Leader>bxf",
                "<cmd>TodoTelescope<cr>",
                mode = "n",
                desc = "TODO - Telescope"
            },
        }
    },
    {
        'Wansmer/treesj',
        enabled = true,
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
                check_syntax_error = true,
                max_join_length = 120,
                -- Cursor behavior:
                -- hold - cursor follows the node/place on which it was called
                -- start - cursor jumps to the first symbol of the node being formatted
                -- end - cursor jumps to the last symbol of the node being formatted
                cursor_behavior = 'hold',
                dot_repeat = true,
                langs = {
                    elixir = {
                        arguments = {
                            both = {
                                separator = ',',
                                last_separator = false,
                            },
                        },
                        tuple = {
                            both = {
                                separator = ',',
                                last_separator = false,
                            },
                        },
                        keywords = {
                            both = {
                                separator = ',',
                                last_separator = false,
                                non_bracket_node = true,
                                recursive = false,
                            },
                        },
                        map_content = {
                            both = {
                                separator = ',',
                                last_separator = false,
                                non_bracket_node = true,
                            },
                        },
                    },
                }
            })
        end,
        keys = {
            {
                "<Leader>ajt",
                "<cmd>TSJToggle<cr>",
                mode = "n",
                desc = "SplitJoin - Toggle"
            },
            {
                "<Leader>ajs",
                "<cmd>TSJSplit<cr>",
                mode = "n",
                desc = "SplitJoin - Split"
            },
            {
                "<Leader>ajj",
                "<cmd>TSJJoin<cr>",
                mode = "n",
                desc = "SplitJoin - Join",
            },
        }
    },
    {
        "nvchad/minty",
        enabled = true,
        lazy = true,
        dependencies = {
            "nvchad/volt",
        },
        keys = {
            {
                "<Leader>bcph",
                function() require("minty.huefy").open({ border = true }) end,
                desc = "Hue picker"
            },
            {
                "<Leader>bcps",
                function() require("minty.shades").open({ border = true }) end,
                desc = "Shade picker"
            }
        }
    },
    {
        -- NOTE: This plugin slows down scrolling _significantly_ in files
        -- where a lot of color strings are present. The larger the amount of
        -- color strings in the window the worse it gets.
        "brenoprata10/nvim-highlight-colors",
        enabled = true,
        config = function()
            -- Ensure termguicolors is enabled if not already
            vim.opt.termguicolors = true

            require("nvim-highlight-colors").setup({
                ---Render style
                ---@usage 'background'|'foreground'|'virtual'
                render = 'background',

                ---Highlight hex colors, e.g. '#FFFFFF'
                enable_hex = true,
                ---Highlight short hex colors e.g. '#fff'
                enable_short_hex = true,
                ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
                enable_rgb = true,
                ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
                enable_hsl = true,
                ---Highlight CSS variables, e.g. 'var(--testing-color)'
                enable_var_usage = true,
                ---Highlight named colors, e.g. 'green'
                enable_named_colors = true,
                ---Highlight tailwind colors, e.g. 'bg-blue-500'
                enable_tailwind = false,
            })
        end,
        keys = {
            {
                "<Leader>bcht",
                function() require("nvim-highlight-colors").toggle() end,
                desc = "Toggle color code highlights"
            },
        }
    },
    {
        "Goose97/alternative.nvim",
        enabled = true,
        version = "*",
        event = "VeryLazy",
        config = function()
            require("alternative").setup({
                rules = {
                    "general.compare_operator_flip",
                    "javascript.if_condition_flip",
                    "javascript.ternary_to_if_else",
                    "javascript.function_definition_variants",
                    "javascript.arrow_function_implicit_return",
                    "typescript.function_definition_variants",
                    "lua.if_condition_flip",
                    "lua.ternary_to_if_else",
                    "lua.wrap_it_test_in_describe",
                    "elixir.function_definition_variants",
                    "elixir.if_condition_flip",
                    "elixir.if_expression_variants",
                    "elixir.pipe_first_function_argument",
                    custom = {},
                },
                select_labels = "neiotsra",
                keymaps = {
                    alternative_next = "<leader>ban",
                    alternative_prev = "<leader>bap",
                },
            })
        end
    },
    {
        "nvim-neotest/neotest",
        enabled = true,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "jfpedroza/neotest-elixir",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-elixir")
                }
            })
        end,
        keys = {
            {
                "<Leader>bt<space>",
                function() require("neotest").run.run() end,
                mode = "n",
                desc = "Neotest - Run nearest test"
            },
            {
                "<Leader>btt",
                function() require("neotest").run.run() end,
                mode = "n",
                desc = "Neotest - Run nearest test"
            },
            {
                "<Leader>bta",
                function() require("neotest").run.run(vim.fn.expand("%")) end,
                mode = "n",
                desc = "Neotest - Run all tests in file"
            },
            {
                "<Leader>bts",
                function() require("neotest").summary.toggle() end,
                mode = "n",
                desc = "Neotest - Summary window toggle"
            },
            {
                "<Leader>btf",
                function() require("neotest").output.open() end,
                mode = "n",
                desc = "Neotest - Open single test result window"
            },
            {
                "<Leader>btp",
                function() require("neotest").output.open() end,
                mode = "n",
                desc = "Neotest - Toggle test results panel"
            },
            {
                "<Leader>btw",
                function() require("neotest").watch.toggle(vim.fn.expand("%")) end,
                mode = "n",
                desc = "Neotest - Watch current test file"
            },
        }
    },
    {
        "shrynx/line-numbers.nvim",
        enabled = true,
        opts = {},
    },
    {
        "yorickpeterse/nvim-window",
        keys = {
            {
                "<leader>p",
                "<cmd>lua require('nvim-window').pick()<cr>",
                desc = "nvim-window: pick window (mnemonic: (P)ane)",
            },
        },
        config = {
            chars = { 't', 'r', 's', 'a', 'n', 'e', 'i', 'o', 'd', 'h', 'f', 'p', 'u', 'l', 'w', 'y', 'c', 'q', 'z' },
        },
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            restricted_keys = {
                ["<Up>"] = { "n", "x" },
                ["<Down>"] = { "n", "x" },
                ["<Left>"] = { "n", "x" },
                ["<Right>"] = { "n", "x" },
            },
            disabled_keys = {
                ["<Up>"] = false,
                ["<Down>"] = false,
                ["<Left>"] = false,
                ["<Right>"] = false,
            },
        },
    },
}
