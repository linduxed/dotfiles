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
        enabled = true,
        config = function()
            require('gitsigns').setup {
                -- Toggle with `:Gitsigns toggle_signs`
                signcolumn = true,
                -- Toggle with `:Gitsigns toggle_numhl`
                numhl = false,
                -- Toggle with `:Gitsigns toggle_linehl`
                linehl = false,
                -- Toggle with `:Gitsigns toggle_word_diff`
                word_diff = false,
                -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame = false,
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
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end
    },
    {
        'claydugo/browsher.nvim',
        event = "VeryLazy",
        config = function()
            -- Specify empty to use below default options
            require("browsher").setup({
                --- Command to open URLs (e.g., 'firefox').
                --- If this is a single character, it will be interpreted as a vim register
                --- instead. For example, to copy the url to your OS clipboard instead of
                --- opening it inside an application, set `open_cmd` to `+` for unix systems,
                --- or `*` if you're on Windows.
                open_cmd = "xdg-open",
            })
        end,
        keys = {
            {
                "<Leader>bbc",
                '<cmd>Browsher commit<CR>',
                mode = "n",
                desc = "Browsher - open file on latest commit"
            },
            {
                "<Leader>bbc",
                '<cmd>Browsher commit<CR>',
                mode = "v",
                desc = "Browsher - open lines on latest commit"
            },
            {
                "<Leader>bbt",
                '<cmd>Browsher tag<CR>',
                mode = "n",
                desc = "Browsher - open file on latest tag"
            },
            {
                "<Leader>bbt",
                '<cmd>Browsher tag<CR>',
                mode = "v",
                desc = "Browsher - open lines on latest tag"
            },
        }
    }
}
