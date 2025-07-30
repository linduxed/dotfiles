return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup({
                ---@type false | "classic" | "modern" | "helix"
                preset = "helix",
                spec = {},
                -- show a warning when issues were detected with your mappings
                notify = true,
                -- Enable/disable WhichKey for certain mapping modes
                triggers = {
                    -- Default value. Will setup keymap triggers for every mode
                    -- automatically and will trigger during `ModeChanged`.
                    { "<auto>", mode = "nixsotc" },

                    -- Auto triggers will never be created for existing
                    -- keymaps. That includes every valid single key Neovim
                    -- builtin mapping. If you want to trigger on a builtin
                    -- keymap, you have to add it manually. Example:
                    -- { "a", mode = { "n", "v" } },
                },
                plugins = {
                    -- shows a list of your marks on ' and `
                    marks = true,
                    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    registers = true,
                    spelling = {
                        -- enabling this will show WhichKey when pressing
                        -- z= to select spelling suggestions
                        --
                        -- how many suggestions should be shown in the list?
                        suggestions = 20,
                    },
                    -- the presets plugin, adds help for a bunch of default
                    -- keybindings in Neovim. No actual key bindings are created
                    presets = {
                        -- adds help for operators like d, y, ...
                        operators = true,
                        -- adds help for motions
                        motions = true,
                        -- help for text objects triggered after entering an operator
                        text_objects = true,
                        -- default bindings on <c-w>
                        windows = true,
                        -- misc bindings to work with windows
                        nav = true,
                        -- bindings for folds, spelling and others prefixed with z
                        z = true,
                        -- bindings for prefixed with g
                        g = true,
                    },
                },
            })

            local wk = require("which-key")

            wk.add({
                {
                    mode = { "n" },
                    { "<leader>a",   group = "Misc #1" },
                    { "<leader>aa",  group = "Align text (Tabularize)" },
                    { "<leader>ae",  group = "Treesitter" },
                    { "<leader>aea", group = "Toggle - All buffers" },
                    { "<leader>aeb", group = "Toggle - Current buffer" },
                    { "<leader>af",  group = "Folds" },
                    { "<leader>afm", group = "Foldmethod" },
                    { "<leader>aj",  group = "SplitJoin" },
                    { "<leader>aq",  group = "Buffer/Window closing (Sayonara)" },
                    { "<leader>ar",  group = "Trouble (tRouble)" },
                    { "<leader>as",  group = "Spelling" },
                    { "<leader>asc", group = "Autocorrect" },
                    { "<leader>asl", group = "Language" },
                    { "<leader>at",  group = "Text width" },
                    { "<leader>aw",  group = "Whitespace" },
                    { "<leader>ay",  group = "Yank" },
                    { "<leader>b",   group = "Misc #2" },
                    { "<leader>ba",  group = "Code modification (alternative.nvim)" },
                    { "<leader>bb",  group = "Open in browser (Browsher)" },
                    { "<leader>bp",  group = "File name (yanking and printing)" },
                    { "<leader>bs",  group = "Session management" },
                    { "<leader>bc",  group = "Color and highlights" },
                    { "<leader>bcp", group = "Picker (Minty)" },
                    { "<leader>bch", group = "Color codes highlights" },
                    { "<leader>bct", group = "Treesitter highlights" },
                    { "<leader>bf",  group = "File name yank/print" },
                    { "<leader>bt",  group = "neotest" },
                    { "<leader>bx",  group = "todo-comments.nvim" },
                    { "<leader>c",   group = "Commenting" },
                    { "<leader>f",   group = "Fuzzy finding (Telescope)" },
                    { "<leader>fe",  group = "File finding (_e_dit)" },
                    { "<leader>m",   group = "Highlight words with color (Mark)" },
                    { "<leader>n",   group = "Snippets" },
                    { "<leader>s",   group = "Search (CtrlSF)" },
                    { "<leader>sw",  group = "Window" },
                },
                {
                    mode = { "v" },
                    { "<leader>a",  group = "Misc #1" },
                    { "<leader>aa", group = "Align text (Tabularize)" },
                    { "<leader>c",  group = "Commenting" },
                    { "<leader>m",  group = "Highlight words with color (Mark)" },
                    { "<leader>s",  group = "Search (CtrlSF)" },
                }
            })
        end
    },
}
