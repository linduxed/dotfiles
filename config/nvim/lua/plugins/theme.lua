return {
    {
        "savq/melange-nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.opt.termguicolors = true
        end
    },
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
    },
}
