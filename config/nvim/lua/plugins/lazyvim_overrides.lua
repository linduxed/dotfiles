return {
    {
        "L3MON4D3/LuaSnip",
        keys = {
            {
                "<leader>an",
                function()
                    require("luasnip.loaders").edit_snippet_files()
                end,
                desc = "Snippets - Edit",
            },
            {
                "<M-.>",
                function()
                    local luasnip = require("luasnip")
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    end
                end,
                mode = { "i", "s" },
                desc = "Snippets - Next choice",
            },
            {
                "<M-,>",
                function()
                    local luasnip = require("luasnip")
                    if luasnip.choice_active() then
                        luasnip.change_choice(-1)
                    end
                end,
                mode = { "i", "s" },
                desc = "Snippets - Prev choice",
            },
        },
        opts = function(_, opts)
            local luasnip = require("luasnip")
            luasnip.filetype_extend("heex", { "eelixir" })
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })
            return opts
        end,
    },
    {
        "ThePrimeagen/harpoon",
        keys = function()
            local keys = {
                {
                    "<leader>hh",
                    function()
                        require("harpoon"):list():add()
                    end,
                    desc = "Harpoon File",
                },
                {
                    "<leader>he",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "Harpoon Quick Menu",
                },
            }

            for i = 1, 9 do
                table.insert(keys, {
                    "<leader>h" .. i,
                    function()
                        require("harpoon"):list():select(i)
                    end,
                    desc = "Harpoon to File " .. i,
                })
            end
            return keys
        end,
    },
}
