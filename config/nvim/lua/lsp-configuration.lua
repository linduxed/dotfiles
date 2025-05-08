local wk = require("which-key")

wk.add({
    {
        "[g",
        function() vim.diagnostic.jump({ count = 1, float = true }) end,
        desc = "Move to previous diagnostic.",
    },
    {
        "]g",
        function() vim.diagnostic.jump({ count = -1, float = true }) end,
        desc = "Move to next diagnostic.",
    },
})

wk.add({
    { "<leader>al",  group = "LSP-related" },
    {
        "<leader>alc",
        vim.lsp.buf.code_action,
        desc = "Select code action for current cursor position"
    },
    {
        "<leader>ald",
        vim.lsp.buf.definition,
        desc = "Jump to definition"
    },
    {
        "<leader>alf",
        vim.lsp.buf.format,
        desc = "Format file"
    },
    {
        "<leader>alh",
        vim.lsp.buf.hover,
        desc = "Hover help"
    },
    {
        "<leader>alm",
        vim.lsp.buf.rename,
        desc = "Rename all references to symbol under cursor"
    },
    {
        "<leader>als",
        vim.lsp.buf.signature_help,
        desc = "Display signature information about symbol cursor"
    },
    {
        "<leader>alt",
        vim.lsp.buf.type_definition,
        desc = "Jump to type definition"
    },

    { "<leader>alw", group = "LSP workspace" },
    {
        "<leader>alwa",
        vim.lsp.buf.add_workspace_folder,
        desc = "Add folder to the workspace."
    },
    {
        "<leader>alwl",
        function() vim.print(vim.lsp.buf.list_workspace_folders()) end,
        desc = "List workspace folders."
    },
    {
        "<leader>alwr",
        vim.lsp.buf.remove_workspace_folder,
        desc = "Remove folder from the workspace."
    },
})

wk.add({ {
    mode = { "v" },
    { "<leader>al",  group = "LSP-related" },
    { "<leader>alf", vim.lsp.buf.format,   desc = "Format file" },
} })

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            completion = { enable = true, },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),

                -- Prevent asking about adding a `.luarc.json` file in every
                -- Lua project directory.
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique
            -- identifier
            telemetry = { enable = false },
            runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
        },
    },
})
vim.lsp.enable('lua_ls')

vim.lsp.config('elixirls', {
    cmd = { vim.env.HOME .. "/.elixir-ls/release/language_server.sh" },
    elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
    }
})
vim.lsp.enable('elixirls')

vim.lsp.config('erlangls', {
    cmd = { vim.env.HOME .. "/.erlang_ls/release/bin/erlang_ls" },
})
vim.lsp.enable('erlangls')

vim.lsp.enable('gleam')
vim.lsp.enable('solargraph')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('gopls')

-- Tailwind configured by tailwind-tools.nvim
