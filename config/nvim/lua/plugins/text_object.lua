return {
    {
        "kana/vim-textobj-indent",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_indent_no_default_key_mappings = 1
        end,
        keys = {
            {
                "ti",
                "<Plug>(textobj-indent-a)",
                mode = "x",
                desc = "Indentation - A"
            },
            {
                "ti",
                "<Plug>(textobj-indent-a)",
                mode = "o",
                desc = "Indentation - A"
            },
            {
                "ri",
                "<Plug>(textobj-indent-i)",
                mode = "x",
                desc = "Indentation - I"
            },
            {
                "ri",
                "<Plug>(textobj-indent-i)",
                mode = "o",
                desc = "Indentation - I"
            },
        }
    },
    {
        "saihoooooooo/vim-textobj-space",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_space_no_default_key_mappings = 1
        end,
        keys = {
            {
                "tS",
                "<Plug>(textobj-space-a)",
                mode = "x",
                desc = "Whitespace - A"
            },
            {
                "tS",
                "<Plug>(textobj-space-a)",
                mode = "o",
                desc = "Whitespace - A"
            },
            {
                "rS",
                "<Plug>(textobj-space-i)",
                mode = "x",
                desc = "Whitespace - I"
            },
            {
                "rS",
                "<Plug>(textobj-space-i)",
                mode = "o",
                desc = "Whitespace - I"
            },
        }
    },
    {
        "lucapette/vim-textobj-underscore",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_underscore_no_default_key_mappings = 1
        end,
        keys = {
            {
                "t_",
                "<Plug>(textobj-underscore-a)",
                mode = "x",
                desc = "Underscores - A"
            },
            {
                "t_",
                "<Plug>(textobj-underscore-a)",
                mode = "o",
                desc = "Underscores - A"
            },
            {
                "r_",
                "<Plug>(textobj-underscore-i)",
                mode = "x",
                desc = "Underscores - I"
            },
            {
                "r_",
                "<Plug>(textobj-underscore-i)",
                mode = "o",
                desc = "Underscores - I"
            },
        }
    },
    {
        "mattn/vim-textobj-url",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_url_no_default_key_mappings = 1
        end,
        keys = {
            {
                "tu",
                "<Plug>(textobj-url-a)",
                mode = "x",
                desc = "URL - A"
            },
            {
                "tu",
                "<Plug>(textobj-url-a)",
                mode = "o",
                desc = "URL - A"
            },
            {
                "ru",
                "<Plug>(textobj-url-i)",
                mode = "x",
                desc = "URL - I"
            },
            {
                "ru",
                "<Plug>(textobj-url-i)",
                mode = "o",
                desc = "URL - I"
            },
        }
    },
}
