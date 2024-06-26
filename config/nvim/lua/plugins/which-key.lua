return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local presets = require("which-key.plugins.presets")

            -- Disable all plugin presets, before calling `setup(opts)`.
            --
            -- This is done because I use my `colemak.nvim` plugin, where
            -- there are some mappings (e.g. `y` replacing `w`), which get a
            -- slight delay added to them. This would make sense with default
            -- Neovim mappings (i.e. it's OK for a 300ms pause after `y`),
            -- but with my altered mappings (navigating words with `y`
            -- instead), the delay becomes irritating. The setting of
            -- operators to `nil` is done to prevent all default
            -- configuration of these mappings.
            presets.operators["v"] = nil
            presets.operators["d"] = nil
            presets.operators["c"] = nil
            presets.operators["y"] = nil
            presets.operators["g~"] = nil
            presets.operators["gu"] = nil
            presets.operators["gU"] = nil
            presets.operators[">"] = nil
            presets.operators["<lt>"] = nil
            presets.operators["zf"] = nil
            presets.operators["!"] = nil
            presets.operators["v"] = nil
            presets.operators["V"] = nil

            require("which-key").setup({
                plugins = {
                    -- shows a list of your marks on ' and `
                    marks = true,
                    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    registers = true,
                    spelling = {
                        -- disabled, because this plugin is hard-coded to trigger
                        -- on z=, which in my Colemak configuration should be b=
                        -- instead.
                        enabled = false,
                    },
                    presets = {
                        -- many of the following features are disabled due to them
                        -- conflicting with my Colemak configuration, causing
                        -- delays in input and help on the wrong (default)
                        -- mappings.
                        operators = false,
                        motions = false,
                        text_objects = false,
                        windows = false,
                        nav = true,
                        z = false,
                        g = true,
                    },
                },
            })
            local wk = require("which-key")

            wk.register(
                {
                    ["<leader>"] = {
                        a = {
                            name = "Misc #1",
                            a = { name = "Align text (Tabularize)" },
                            j = { name = "SplitJoin" },
                            f = {
                                name = "Folds",
                                m = { name = "Foldmethod" }
                            },
                            r = { name = "Trouble (tRouble)" },
                            s = {
                                name = "Spelling",
                                c = { name = "Autocorrect" }
                            },
                            t = { name = "Text width" },
                            q = { name = "Buffer/Window closing (Sayonara)" },
                            y = { name = "Yank" },
                            w = { name = "Whitespace" },
                        },
                        b = {
                            name = "Misc #2",
                            s = { name = "Session management" },
                            t = { name = "todo-comments.nvim" }
                        },
                        c = { name = "Commenting" },
                        f = { name = "Fuzzy finding (Telescope)" },
                        m = { name = "Highlight words with color (Mark)" },
                        n = { name = "Snippets" },
                        p = { name = "File name (yanking and printing)" },
                        s = {
                            name = "Search (CtrlSF)",
                            w = { name = "Window" },
                        },
                    }
                },
                { mode = "n" }
            )

            wk.register(
                {
                    ["<leader>"] = {
                        a = {
                            name = "Misc #1",
                            a = { name = "Align text (Tabularize)" },
                        },
                        c = { name = "Commenting" },
                        m = { name = "Highlight words with color (Mark)" },
                        s = { name = "Search (CtrlSF)" },
                    }
                },
                { mode = "v" }
            )
        end
    },
}
