return {
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
            },
            {
                'rmagatti/auto-session',
                lazy = false,
                config = function()
                    require("auto-session").setup({
                        auto_session_allowed_dirs = {
                            "~/.dotfiles",
                            "~/Documents/exercism",
                            "~/Documents/programming",
                            "~/Documents/studies",
                            "~/Documents/upstream_repos",
                            "~/Documents/work",
                            "~/Documents/writing",
                            "~/build",
                            "~/vimwiki",
                        },
                    })
                end,
                keys = {
                    {
                        "<Leader>bss",
                        "<Cmd>SessionSave<CR>",
                        mode = "n",
                        desc = "Session - Save"
                    },
                    {
                        "<Leader>bsd",
                        "<Cmd>SessionDelete<CR>",
                        mode = "n",
                        desc = "Session - Delete"
                    },
                    {
                        "<Leader>bsr",
                        "<Cmd>SessionRestore<CR>",
                        mode = "n",
                        desc = "Session - Restore"
                    },
                    {
                        "<Leader>bsp",
                        "<Cmd>SessionPurgeOrphaned<CR>",
                        mode = "n",
                        desc = "Session - Purge orphaned"
                    },
                    {
                        "<Leader>bsf",
                        "<Cmd>SessionRestoreFromFile<CR>",
                        mode = "n",
                        desc = "Session - Restore from file"
                    },
                }
            }
        },
        config = function()
            local actions = require("telescope.actions")
            local drop_mappings = {
                i = {
                    ["<CR>"] = actions.select_default,
                    ["<S-CR>"] = actions.select_drop,
                },
                n = {
                    ["<S-CR>"] = actions.select_default,
                    ["<CR>"] = actions.select_drop,
                }
            }

            require("telescope").setup({
                pickers = {
                    -- Using `actions.select_drop` works as if the chosen file
                    -- was passed as an argument to `:drop`, which will jump to
                    -- a window where the file is already opened.
                    --
                    -- Not sure how `select_drop` will work with multiple
                    -- selected files.
                    buffers = { mappings = drop_mappings },
                    find_files = { mappings = drop_mappings },
                    git_files = { mappings = drop_mappings },
                    old_files = { mappings = drop_mappings },
                },
                extensions = {
                    undo = {
                        layout_strategy = "vertical",

                        mappings = {
                            i = {
                                ["<cr>"] = require("telescope-undo.actions").restore,
                                ["<S-cr>"] = require("telescope-undo.actions").yank_additions,
                                ["<C-cr>"] = require("telescope-undo.actions").yank_deletions,
                            },
                            n = {
                                ["c"] = require("telescope-undo.actions").yank_additions,
                                ["C"] = require("telescope-undo.actions").yank_deletions,
                                ["z"] = require("telescope-undo.actions").restore,
                            },
                        },
                    },
                },
            })

            require("telescope").load_extension("undo")
            require('telescope').load_extension('fzf')
            require("telescope").load_extension("session-lens")

            -- Misc. mappings
            vim.keymap.set("n",
                "<C-p>",
                function() require('telescope.builtin').find_files({ follow = true }) end,
                { desc = "Telescope - Files" }
            )
            vim.keymap.set("n",
                "<leader>fef",
                function() require('telescope.builtin').find_files({ follow = true }) end,
                { desc = "Telescope - Files" }
            )
            vim.keymap.set("n",
                "<leader>feg",
                function() require('telescope.builtin').git_files({ follow = true }) end,
                { desc = "Telescope - Git files" }
            )
            vim.keymap.set("n",
                "<leader>fg",
                function() require('telescope.builtin').live_grep() end,
                { desc = "Telescope - Line, all files, exact grep" }
            )
            vim.keymap.set("n",
                "<leader>fr",
                function()
                    require('telescope.builtin').grep_string({
                        shorten_path = true,
                        word_match = "-w",
                        only_sort_text = true,
                        search = ''
                    })
                end,
                { desc = "Telescope - Line, all files, fuzzy" }
            )
            vim.keymap.set("n",
                "<leader>fh",
                function() require('telescope.builtin').help_tags() end,
                { desc = "Telescope - Help tags" }
            )
            vim.keymap.set("n",
                "<leader>fm",
                function() require('telescope.builtin').marks() end,
                { desc = "Telescope - Marks" }
            )
            vim.keymap.set("n",
                "<leader>fb",
                function() require('telescope.builtin').current_buffer_fuzzy_find() end,
                { desc = "Telescope - Line, current buffer, fuzzy" }
            )
            vim.keymap.set("n",
                "<leader>ft",
                function() require('telescope.builtin').treesitter() end,
                { desc = "Telescope - Treesitter" }
            )
            vim.keymap.set("n",
                "<leader>fap",
                function() require('telescope.builtin').builtin() end,
                { desc = "Telescope - List all pickers" }
            )
            vim.keymap.set("n",
                "<leader>fs",
                "<cmd>Telescope session-lens<cr>",
                { desc = "Telescope - Sessions" }
            )
            vim.keymap.set("n",
                "<leader>fo",
                "<cmd>Telescope colorscheme<cr>",
                { desc = "Telescope - Colorscheme (c_O_lorscheme)" }
            )
            vim.keymap.set("n",
                "<leader>fc",
                "<cmd>TodoTelescope<cr>",
                { desc = "Telescope - TODO comments" }
            )
            vim.keymap.set("n",
                "<F6>",
                "<cmd>Telescope undo<cr>",
                { desc = "Telescope - Undo tree" }
            )

            -- LSP mappings
            vim.keymap.set("n",
                "<leader>alr",
                function() require('telescope.builtin').lsp_references() end,
                { desc = "Telescope - LSP - references" }
            )
            vim.keymap.set("n",
                "<leader>ali",
                function() require('telescope.builtin').lsp_implementations() end,
                { desc = "Telescope - LSP - Implementations" }
            )
        end,
    },
}
