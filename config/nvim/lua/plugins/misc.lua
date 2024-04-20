return {
    {
        "linduxed/colemak.nvim",
        -- Set to not be lazy, because I find it mentally easier to have it
        -- guaranteed that this plugin is loaded; it's hard for me to reason
        -- about the custom mappings of other plugins (commonly to account for
        -- the colemak.nvim) if I'm not sure whether colemak.nvim will have
        -- been loaded.
        lazy = false,
        -- Priority set to some arbitrary high number. If some other plugin
        -- has mappings that conflict with those of colemak.nvim, that plugin
        -- will need to be set to `lazy = true` (haven't figured out another
        -- way) and set the priority to be _lower_ than that of this plugin, to
        -- ensure that the other plugin will apply its mappings _after_
        -- colemak.nvim (higher priority means earlier load).
        priority = 100,
        config = function()
            require("colemak").setup()
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
    {
        "dyng/ctrlsf.vim",
        lazy = false,
        init = function()
            vim.g.ctrlsf_populate_qflist = 1
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
            {
                "<Leader>z",
                function() require("zen-mode").toggle() end,
                desc = "ZenMode"
            }
        }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
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
        init = function()
            vim.g.nrrw_rgn_nomap_nr = 1
            vim.g.nrrw_rgn_nomap_Nr = 1
        end
    },
    {
        "kevinhwang91/nvim-hlslens",
        -- Set to not be lazy to predictably override the mappings of
        -- colemak.nvim, since the mappings for this plugin overlap for
        -- normal-mode `k` and `K`.
        lazy = false,
        -- Priority is set to be 1 less than colemak.nvim, to ensure that
        -- colemak.nvim gets loaded first, followed by this plugin, leading to
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
        config = function()
            require("trouble").setup({})
        end,
        keys = {
            {
                "<Leader>ale",
                "<cmd>TroubleToggle<cr>",
                desc = "Diagnostics window (Trouble)"
            },
        },
    },
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
        init = function()
            vim.g.polyglot_disabled = { "csv", "markdown", "text" }
        end
    },
    {
        "liuchengxu/vista.vim",
        init = function()
            vim.g.vista_icon_indent = { "↳ ", "↦ " }
            vim.g.vista_default_executive = "nvim_lsp"
            vim.g.vista_sidebar_width = 60
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
                mode = { "n", "o", "x" },
                function() require("flash").jump() end,
                desc = "Flash - Jump"
            },
            {
                "gy",
                mode = { "o" },
                function() require("flash").remote() end,
                desc = "Flash - Remote operation (o-mode)"
            },
            {
                "gt",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc = "Flash - Treesitter jump"
            },
            {
                "gT",
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
        -- Set to not be lazy to predictably override the mappings of
        -- colemak.nvim, since the mappings for this plugin overlap for
        -- every key that this plugin touches.
        lazy = false,
        -- Priority is set to be 1 less than colemak.nvim, to ensure that
        -- colemak.nvim gets loaded first, followed by this plugin, leading to
        -- the following being overridden: c, C, s, S, d, D, x, X
        priority = 99,
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
        config = function()
            require("hex").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
        },
        opts = {},
        keys = {
            {
                "<Leader>btq",
                "<cmd>TodoQuickFix<cr>",
                mode = "n",
                desc = "TODO - QuickFix list"
            },
            {
                "<Leader>btl",
                "<cmd>TodoLocList<cr>",
                mode = "n",
                desc = "TODO - Location list"
            },
            {
                "<Leader>bte",
                "<cmd>TodoTrouble<cr>",
                mode = "n",
                desc = "TODO - Trouble window"
            },
            {
                "<Leader>btf",
                "<cmd>TodoTelescope<cr>",
                mode = "n",
                desc = "TODO - Telescope"
            },
        }
    },
    {
        'Wansmer/treesj',
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
}
