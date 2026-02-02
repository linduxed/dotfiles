return {
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                {
                    mode = { "n" },
                    { "<leader>a",   group = "misc" },
                    { "<leader>ac",  group = "Color and highlights" },
                    { "<leader>acp", group = "Picker (Minty)" },
                    { "<leader>af",  group = "Folds" },
                    { "<leader>afm", group = "Foldmethod" },
                    { "<leader>ai",  group = "AI" },
                    { "<leader>ap",  group = "Print info" },
                    { "<leader>as",  group = "Spelling" },
                    { "<leader>asc", group = "Autocorrect" },
                    { "<leader>asl", group = "Language" },
                    { "<leader>at",  group = "Text width" },
                    { "<leader>aw",  group = "Whitespace" },
                    { "<leader>ay",  group = "Yank" },
                    { "<leader>cn",  group = "Code modification (alternative.nvim)" },
                    { "<leader>cj",  group = "SplitJoin" },
                    { "<leader>m",   group = "Highlight words (Mark)" },
                    { "<leader>sx",  group = "CtrlSF" },
                    { "<leader>uq",  group = "Line numbers" },

                },
                {
                    mode = { "v" },
                    { "<leader>m",  group = "Highlight words (Mark)" },
                }
            }
        },
    },
}
