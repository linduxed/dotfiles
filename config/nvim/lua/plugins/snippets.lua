return {
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").load({
                paths = os.getenv("HOME") .. "/.config/nvim/snippets"
            })

            require("luasnip").config.set_config({
                -- Tells LuaSnip to remember to keep around the last snippet.
                -- One can jump back into it even if you move outside of the selection.
                history = false,
                -- This allows dynamic snippets to update as one types.
                update_events = "TextChanged,TextChangedI",
            })

            -- Copied from the LuaSnip documentation
            vim.cmd([[
            " press <tab> to expand or jump in a snippet. these can also be mapped
            " separately " via <plug>luasnip-expand-snippet and <plug>luasnip-jump-next.
            imap <silent><expr> <tab> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : '<tab>'

            " -1 for jumping backwards.
            inoremap <silent> <s-tab> <cmd>lua require'luasnip'.jump(-1)<cr>

            snoremap <silent> <tab> <cmd>lua require('luasnip').jump(1)<cr>
            snoremap <silent> <s-tab> <cmd>lua require('luasnip').jump(-1)<cr>

            " for changing choices in choicenodes (not strictly necessary for a basic setup).
            imap <silent><expr> <c-e> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-e>'
            smap <silent><expr> <c-e> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-e>'
            ]])

            vim.keymap.set("n", "<leader>rse", function()
                require("luasnip.loaders").edit_snippet_files()
            end)
        end,
    },
    "honza/vim-snippets",
}
