return {
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
}
