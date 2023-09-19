local lsp = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local wk = require("which-key")

wk.register(
    {
        ["[g"] = { vim.diagnostic.goto_prev, "Move to previous diagnostic." },
        ["]g"] = { vim.diagnostic.goto_next, "Move to next diagnostic." },
    }, {}
)

local function on_attach(_, buf)
    wk.register(
        {
            ["<leader>al"] = {
                name = "LSP-related",
                h = { vim.lsp.buf.hover, "Hover help", buffer = buf },
                f = { vim.lsp.buf.format, "Format file", buffer = buf },
                m = { vim.lsp.buf.rename, "Rename all references to symbol under cursor", buffer = buf },
                d = { vim.lsp.buf.definition, "Jump to definition", buffer = buf },
                c = { vim.lsp.buf.code_action, "Select code action for current cursor position", buffer = buf },
                s = { vim.lsp.buf.signature_help, "Display signature information about symbol cursor", buffer = buf },
                t = { vim.lsp.buf.type_definition, "Jump to type definition", buffer = buf },

                w = { name = "LSP workspace" },
                ["wa"] = { vim.lsp.buf.add_workspace_folder, "Add folder to the workspace.", buffer = buf },
                ["wr"] = { vim.lsp.buf.remove_workspace_folder, "Remove folder from the workspace.", buffer = buf },
                ["wl"] = {
                    function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end,
                    "List workspace folders.",
                    buffer = buf
                },
            },
        }, {}
    )
    wk.register(
        {
            ["<leader>al"] = {
                name = "LSP-related",
                f = { vim.lsp.buf.format, "description", buffer = buf },
            },
        },
        { mode = "v" }
    )
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
