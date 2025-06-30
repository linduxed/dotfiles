return {
    "neovim/nvim-lspconfig",
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("tailwind-tools").setup({
                server = {
                    settings = {
                        includeLanguages = {
                            elixir = "html-eex",
                            eelixir = "html-eex",
                            heex = "html-eex",
                            eruby = "erb",
                        },
                    }
                },
                document_color = {
                    -- disable, to allow nvim-highlight-colors to add colors
                    -- for tailwind classes.
                    enabled = false,
                },
            })
        end
    }
}
