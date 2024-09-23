return {
    "neovim/nvim-lspconfig",
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- null_ls.builtins.diagnostics.credo,
                    null_ls.builtins.diagnostics.zsh,
                    -- null_ls.builtins.formatting.erlfmt,
                    null_ls.builtins.formatting.fnlfmt,
                    null_ls.builtins.formatting.jq,
                }
            })
        end
    },
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
                }
            })
        end
    }
}
