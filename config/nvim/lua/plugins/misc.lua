return {
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
                "<Leader>sxp",
                "<Plug>CtrlSFPrompt",
                mode = "n",
                desc = "CtrlSF - Bare prompt"
            },
            {
                "<Leader>sxc",
                "<Plug>CtrlSFCwordPath",
                mode = "n",
                desc = "CtrlSF - Word under cursor"
            },
            {
                "<Leader>sxb",
                "<Plug>CtrlSFCCwordPath",
                mode = "n",
                desc = "CtrlSF - Word (and boundary) under cursor"
            },
            {
                "<Leader>sxl",
                "<Plug>CtrlSFPwordPath",
                mode = "n",
                desc = "CtrlSF - Last search pattern"
            },
            {
                "<Leader>sxwf",
                "<cmd>CtrlSFFocus<cr>",
                mode = "n",
                desc = "CtrlSF - Focus"
            },
            {
                "<Leader>sxwt",
                "<cmd>CtrlSFToggle<cr>",
                mode = "n",
                desc = "CtrlSF - Toggle"
            },
            {
                "<Leader>sxwu",
                "<cmd>CtrlSFUpdate<cr>",
                mode = "n",
                desc = "CtrlSF - Update (run same search)"
            },
            {
                "<Leader>sxc",
                "<Plug>CtrlSFVwordExec",
                mode = "v",
                desc = "CtrlSF - Search highlighted"
            },
            {
                "<Leader>sxp",
                "<Plug>CtrlSFVwordPath",
                mode = "v",
                desc = "CtrlSF - Open prompt with highlighted"
            },
        }
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
                "<Leader>az",
                function() require("zen-mode").toggle() end,
                desc = "ZenMode"
            }
        }
    },
    "nvim-tree/nvim-web-devicons",
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
    {
        "hedyhli/outline.nvim",
        enabled = true,
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            {
                "<F10>",
                "<cmd>OutlineFocus<CR>",
                desc = "Focus outline",
            },
            {
                "<F11>",
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
        },
    },
    "guns/xterm-color-table.vim",
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
        "obsidian-nvim/obsidian.nvim",
        version = "*", -- use latest release, remove to use latest commit
        ft = "markdown",
        opts = {
            workspaces = {
                { name = "personal", path = "~/notes", },
            },
        },
    },
    {
        "folke/flash.nvim",
        opts = {
            labels = "arstoienhdwfpyulgjqzxcvmkb",
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
            {
                "<leader>wt",
                "<Cmd>WinShift<CR>",
                mode = "n",
                desc = "Window move (_t_ransport)",
            },

            -- Swap two windows:
            {
                "<leader>wX",
                "<Cmd>WinShift swap<CR>",
                mode = "n",
                desc = "Window swap mode",
            },
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
                "<Leader>cjt",
                "<cmd>TSJToggle<cr>",
                mode = "n",
                desc = "SplitJoin - Toggle"
            },
            {
                "<Leader>cjs",
                "<cmd>TSJSplit<cr>",
                mode = "n",
                desc = "SplitJoin - Split"
            },
            {
                "<Leader>cjj",
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
                "<Leader>acph",
                function() require("minty.huefy").open({ border = true }) end,
                desc = "Hue picker"
            },
            {
                "<Leader>acps",
                function() require("minty.shades").open({ border = true }) end,
                desc = "Shade picker"
            }
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
                    alternative_next = "<leader>cnn",
                    alternative_prev = "<leader>cnp",
                },
            })
        end
    },
    {
        "shrynx/line-numbers.nvim",
        enabled = true,
        lazy = false,
        keys = {
            {
                "<leader>uqc",
                "<cmd>LineNumberToggle<cr>",
                mode = "n",
                desc = "Line number mode - Cycle"
            },
            {
                "<leader>uqb",
                "<cmd>LineNumberBoth<cr>",
                mode = "n",
                desc = "Line number mode - Both"
            },
            {
                "<leader>uqr",
                "<cmd>LineNumberRelative<cr>",
                mode = "n",
                desc = "Line number mode - Relative"
            },
            {
                "<leader>uqa",
                "<cmd>LineNumberAbsolute<cr>",
                mode = "n",
                desc = "Line number mode - Absolute"
            },
            {
                "<leader>uqn",
                "<cmd>LineNumberNone<cr>",
                mode = "n",
                desc = "Line number mode - None"
            },
        }
    },
    {
        "yorickpeterse/nvim-window",
        keys = {
            {
                "<leader>wp",
                "<cmd>lua require('nvim-window').pick()<cr>",
                desc = "pick window",
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
            disable_mouse = false,
            disabled_keys = {
                ["<Up>"] = false,
                ["<Down>"] = false,
                ["<Left>"] = false,
                ["<Right>"] = false,
            },
            disabled_filetypes = {
                ["Outline"] = true,
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                elixirls = { enabled = false },
                erlangls = { enabled = false },
                expert = { cmd = { vim.env.HOME .. "/bin/expert" } },
            },
        },
    },
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
            { "<leader>aic", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
            { "<leader>aif", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
            { "<leader>air", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
            { "<leader>aiC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
            { "<leader>aim", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
            { "<leader>aib", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
            { "<leader>ais", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
            {
                "<leader>ais",
                "<cmd>ClaudeCodeTreeAdd<cr>",
                desc = "Add file",
                ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
            },
            -- Diff management
            { "<leader>aia", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            { "<leader>aid", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
        },
    },
}
