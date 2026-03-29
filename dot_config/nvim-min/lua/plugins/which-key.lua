return {
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                {
                    mode = { "n" },
                    { "<leader>a",   group = "misc" },
                    { "<leader>ac",  group = "Color and highlights" },
                    { "<leader>af",  group = "Folds" },
                    { "<leader>afm", group = "Foldmethod" },
                    { "<leader>ap",  group = "Print info" },
                    { "<leader>as",  group = "Spelling" },
                    { "<leader>asc", group = "Autocorrect" },
                    { "<leader>asl", group = "Language" },
                    { "<leader>at",  group = "Text width" },
                    { "<leader>aw",  group = "Whitespace" },
                    { "<leader>ay",  group = "Yank" },
                    { "<leader>cx",  group = "Code swap (sibling-swap.nvim)" },
                    { "<leader>m",   group = "Highlight words (Mark)" },
                },
                {
                    mode = { "v" },
                    { "<leader>a",  group = "misc" },
                    { "<leader>ay", group = "Yank" },
                    { "<leader>m",  group = "Highlight words (Mark)" },
                }
            }
        },
    },
}
