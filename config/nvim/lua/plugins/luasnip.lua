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
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })
      return opts
    end,
  },
}
