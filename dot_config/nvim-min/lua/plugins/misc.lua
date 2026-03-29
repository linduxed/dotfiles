return {
    "tpope/vim-capslock",
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
            vim.g.abolish_save_file = "/home/linduxed/.config/nvim/after/plugin/abolish.vim"
        end,
    },
    {
        "chrisgrieser/nvim-genghis",
        enabled = true,
        -- dependencies = "stevearc/dressing.nvim"
        config = function()
            -- running this only to initialize the plugin, as it seems like
            -- it's not being loaded properly.
            require("genghis").setup({})
        end,
    },
    {
        "inkarkat/vim-mark",
        enabled = true,
        dependencies = {
            "inkarkat/vim-ingo-library",
        },
        init = function()
            vim.g.mw_no_mappings = 1
            vim.g.mwDefaultHighlightingPalette = "extended"
        end,
        keys = {
            {
                "<Leader>mm",
                "<Plug>MarkSet",
                desc = "Mark - Word under cursor",
            },
            {
                "<Leader>mm",
                "<Plug>MarkSet",
                mode = "x",
                desc = "Mark - Selected",
            },
            {
                "<Leader>mr",
                "<Plug>MarkRegex",
                desc = "Mark - Regex",
            },
            {
                "<Leader>mr",
                "<Plug>MarkRegex",
                mode = "x",
                desc = "Mark - Regex",
            },
            {
                "<Leader>mt",
                "<Plug>MarkToggle",
                desc = "Mark - Toggle all highlights",
            },
            {
                "<Leader>mx",
                "<Plug>MarkClear",
                desc = "Mark - Remove highlight under cursor",
            },
            {
                "<Leader>mc",
                "<Plug>MarkAllClear",
                desc = "Mark - Remove all highlights",
            },
            {
                "<Leader>m*",
                "<Plug>MarkSearchCurrentNext",
                desc = "Mark - Jump to next instance of current",
            },
            {
                "<Leader>m#",
                "<Plug>MarkSearchCurrentPrev",
                desc = "Mark - Jump to previous instance of current",
            },
            {
                "<Leader>m/",
                "<Plug>MarkSearchAnyNext",
                desc = "Mark - Jump to next highlight (any)",
            },
            {
                "<Leader>m?",
                "<Plug>MarkSearchAnyPrev",
                desc = "Mark - Jump to previous highlight (any)",
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
                width = 50, -- Percentage or integer of columns
                min_width = 50, -- Minimum number of columns
                relative_width = true,
                height = 50, -- Percentage or integer of lines
                min_height = 10, -- Minimum number of lines
                relative_height = true,
                border = "double",
                live = true,
            },
        },
    },
    {
        "stevearc/oil.nvim",
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
        end,
    },
    {
        "folke/flash.nvim",
        opts = {
            labels = "arstoienhdwfpyulgjqzxcvmkb",
        },
    },
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
        },
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
                desc = "Autocorrect - Enable",
            },
            {
                "<Leader>ascd",
                "<Cmd>DisableAutocorrect<CR>",
                mode = "n",
                desc = "Autocorrect - Disable",
            },
            {
                "<F7>",
                "<C-O><Plug>VimyouautocorrectUndo",
                mode = "i",
                desc = "Autocorrect - Undo latest",
            },
            {
                "<Leader>ascu",
                "<Plug>VimyouautocorrectUndo",
                mode = "n",
                desc = "Autocorrect - Undo latest",
            },
            {
                "<F8>",
                "<C-O><Plug>VimyouautocorrectNext",
                mode = "i",
                desc = "Autocorrect - Next suggested correction",
            },
            {
                "<Leader>ascn",
                "<Plug>VimyouautocorrectJump",
                mode = "n",
                desc = "Autocorrect - Next suggested correction",
            },
            {
                "<F9>",
                "<C-O><Plug>VimyouautocorrectPrevious",
                mode = "i",
                desc = "Autocorrect - Previous suggested correction",
            },
            {
                "<Leader>ascp",
                "<Plug>VimyouautocorrectPrevious",
                mode = "n",
                desc = "Autocorrect - Previous suggested correction",
            },
            {
                "<F10>",
                "<C-O><Plug>VimyouautocorrectJump",
                mode = "i",
                desc = "Autocorrect - Jump to latest",
            },
            {
                "<Leader>ascj",
                "<Plug>VimyouautocorrectJump",
                mode = "n",
                desc = "Autocorrect - Jump to latest",
            },
        },
    },
    {
        "Wansmer/treesj",
        enabled = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({
                use_default_keymaps = false,
                check_syntax_error = true,
                max_join_length = 120,
                -- Cursor behavior:
                -- hold - cursor follows the node/place on which it was called
                -- start - cursor jumps to the first symbol of the node being formatted
                -- end - cursor jumps to the last symbol of the node being formatted
                cursor_behavior = "hold",
                dot_repeat = true,
                langs = {
                    elixir = {
                        arguments = {
                            both = {
                                separator = ",",
                                last_separator = false,
                            },
                        },
                        tuple = {
                            both = {
                                separator = ",",
                                last_separator = false,
                            },
                        },
                        keywords = {
                            both = {
                                separator = ",",
                                last_separator = false,
                                non_bracket_node = true,
                                recursive = false,
                            },
                        },
                        map_content = {
                            both = {
                                separator = ",",
                                last_separator = false,
                                non_bracket_node = true,
                            },
                        },
                    },
                },
            })
        end,
        keys = {
            {
                "<Leader>cjt",
                "<cmd>TSJToggle<cr>",
                mode = "n",
                desc = "SplitJoin - Toggle",
            },
            {
                "<Leader>cjs",
                "<cmd>TSJSplit<cr>",
                mode = "n",
                desc = "SplitJoin - Split",
            },
            {
                "<Leader>cjj",
                "<cmd>TSJJoin<cr>",
                mode = "n",
                desc = "SplitJoin - Join",
            },
        },
    },
    {
        "Wansmer/sibling-swap.nvim",
        enabled = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            use_default_keymaps = false,
            highlight_node_at_cursor = true,
            interline_swaps_without_separator = false,
        },
        keys = {
            {
                "<leader>cx.",
                function()
                    require("sibling-swap").swap_with_right()
                end,
                mode = "n",
                desc = "Code swap - Next sibling",
            },
            {
                "<leader>cx,",
                function()
                    require("sibling-swap").swap_with_left()
                end,
                mode = "n",
                desc = "Code swap - Previous sibling",
            },
            {
                "<leader>cx>",
                function()
                    require("sibling-swap").swap_with_right_with_opp()
                end,
                mode = "n",
                desc = "Code swap - Next (flip operator)",
            },
            {
                "<leader>cx<",
                function()
                    require("sibling-swap").swap_with_left_with_opp()
                end,
                mode = "n",
                desc = "Code swap - Previous (flip operator)",
            },
        },
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
            chars = { "t", "r", "s", "a", "n", "e", "i", "o", "d", "h", "f", "p", "u", "l", "w", "y", "c", "q", "z" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
            },
        },
    },
    {
        "folke/snacks.nvim",
        keys = {
            { "<leader>sl", false },
            {
                "<leader>sL",
                function()
                    Snacks.picker.loclist()
                end,
                desc = "Location List",
            },
            {
                "<leader>sl",
                function()
                    Snacks.picker.grep({
                        need_search = false,
                        search = "",
                        live = false,
                        matcher = { fuzzy = true },
                    })
                end,
                desc = "Line, all files, fuzzy",
            },
        },
    },
}
