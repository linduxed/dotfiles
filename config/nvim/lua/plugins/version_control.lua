return {
    {
        "tpope/vim-fugitive",
        dependencies = {
            "tpope/vim-rhubarb",
        },
        init = function()
            vim.g.fugitive_no_maps = 1
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,              -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,             -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false,          -- Toggle with `:Gitsigns toggle_word_diff`
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = ' <author>, <author_time:%Y-%m-%d> - <summary>',
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Text object
                    map({ 'o', 'x' }, 'rh', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end
    },
}
