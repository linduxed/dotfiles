local lsp = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local wk = require("which-key")

wk.add({
    { "[g", vim.diagnostic.goto_prev, desc = "Move to previous diagnostic." },
    { "]g", vim.diagnostic.goto_next, desc = "Move to next diagnostic." },
})

local function on_attach(_, buf)
    wk.add({
        { "<leader>al",  group = "LSP-related" },
        {
            "<leader>alc",
            vim.lsp.buf.code_action,
            buffer = buf,
            desc = "Select code action for current cursor position"
        },
        {
            "<leader>ald",
            vim.lsp.buf.definition,
            buffer = buf,
            desc = "Jump to definition"
        },
        {
            "<leader>alf",
            vim.lsp.buf.format,
            buffer = buf,
            desc = "Format file"
        },
        {
            "<leader>alh",
            vim.lsp.buf.hover,
            buffer = buf,
            desc = "Hover help"
        },
        {
            "<leader>alm",
            vim.lsp.buf.rename,
            buffer = buf,
            desc = "Rename all references to symbol under cursor"
        },
        {
            "<leader>als",
            vim.lsp.buf.signature_help,
            buffer = buf,
            desc = "Display signature information about symbol cursor"
        },
        {
            "<leader>alt",
            vim.lsp.buf.type_definition,
            buffer = buf,
            desc = "Jump to type definition"
        },

        { "<leader>alw", group = "LSP workspace" },
        {
            "<leader>alwa",
            vim.lsp.buf.add_workspace_folder,
            buffer = buf,
            desc = "Add folder to the workspace."
        },
        {
            "<leader>alwl",
            function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end,
            buffer = buf,
            desc = "List workspace folders."
        },
        {
            "<leader>alwr",
            vim.lsp.buf.remove_workspace_folder,
            buffer = buf,
            desc = "Remove folder from the workspace."
        },
    })

    wk.add({ {
        mode = { "v" },
        { "<leader>al", group = "LSP-related" },
        { "<leader>alf", vim.lsp.buf.format, buffer = buf, desc = "Format file" },
    } })
end

lsp.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
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
}

lsp.elixirls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { vim.env.HOME .. "/.elixir-ls/release/language_server.sh" },
    elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
    }
}

lsp.erlangls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { vim.env.HOME .. "/.erlang_ls/release/bin/erlang_ls" },
}

lsp.gleam.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.solargraph.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.tailwindcss.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
