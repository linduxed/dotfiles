return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        keys = {
            {
                "<Leader>aeah",
                ":TSToggle highlight<CR>",
                desc = "Toggle Treesitter highlights"
            },
            {
                "<Leader>aebh",
                ":TSBufToggle highlight<CR>",
                desc = "Toggle buffer Treesitter highlights"
            },

            -- Duplication of mappings to have the ones related to color also
            -- be available under the `<leader>bct` prefix.
            {
                "<Leader>bcta",
                ":TSToggle highlight<CR>",
                desc = "Toggle Treesitter highlights"
            },
            {
                "<Leader>bctb",
                ":TSBufToggle highlight<CR>",
                desc = "Toggle buffer Treesitter highlights"
            },
        }
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require 'treesitter-context'.setup({
                -- How many lines the window should span.
                -- Values <= 0 mean no limit.
                max_lines = 0,
                -- Minimum editor window height to enable context.
                -- Values <= 0 mean no limit.
                min_window_height = 0,
                -- Maximum number of lines to show for a single context
                multiline_threshold = 1,
                -- Which context lines to discard if `max_lines` is exceeded.
                -- Choices: 'inner', 'outer'
                trim_scope = 'outer',
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    "nvim-treesitter/playground",
}
