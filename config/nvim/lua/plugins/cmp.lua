return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-git",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "luckasRanarison/tailwind-tools.nvim",
            "onsails/lspkind-nvim",
        },
        opts = function()
            return {
                formatting = {
                    format = require("lspkind").cmp_format({
                        before = require("tailwind-tools.cmp").lspkind_format
                    }),
                },
            }
        end,
    },
}
