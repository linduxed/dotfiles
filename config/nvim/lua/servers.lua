local lsp = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local function on_attach(_, buf)
    vim.keymap.set("n", "<Leader>alh", vim.lsp.buf.hover, { buffer = buf })
    vim.keymap.set("n", "<Leader>alf", vim.lsp.buf.formatting, { buffer = buf })
    vim.keymap.set("v", "<Leader>alf", vim.lsp.buf.range_formatting, { buffer = buf })
    vim.keymap.set("n", "<Leader>alm", vim.lsp.buf.rename, { buffer = buf })
    vim.keymap.set("n", "<Leader>ald", vim.lsp.buf.definition, { buffer = buf })
    vim.keymap.set("n", "<Leader>alc", vim.lsp.buf.code_action, { buffer = buf })
    vim.keymap.set("n", "<Leader>als", vim.lsp.buf.signature_help, { buffer = buf })
    vim.keymap.set("n", "<Leader>alt", vim.lsp.buf.type_definition, { buffer = buf })
    vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { buffer = buf })
    vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { buffer = buf })
end

-- Lua
lsp.sumneko_lua.setup {
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
    cmd = { vim.env.HOME .. "/.elixir-ls/release/language_server.sh" };
    elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
    }
}

-- Ruby (solargraph)
require'lspconfig'.solargraph.setup{}

-- Rust (rls)
lsp.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}
