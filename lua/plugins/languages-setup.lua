-- Documentation: https://github.com/neovim/nvim-lspconfig

-- neodev must be imported first!
require("neodev").setup {}
local lspconfig = require("lspconfig")

--------------------------LSP--------------------------

-- C & CPP
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}

-- Python
lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                },
            },
        },
    },
}

-- Web
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
    capabilities = capabilities,
}
lspconfig.html.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.tsserver.setup {}
lspconfig.cssmodules_ls.setup {}

-- C#
lspconfig.csharp_ls.setup {
    handlers = {
        ["textDocument/definition"] = require("csharpls_extended").handler,
        ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
    },
}

-- Java
lspconfig.jdtls.setup {}

-- Rust
lspconfig.rust_analyzer.setup {}

-- Json
lspconfig.jsonls.setup {}

-- Lua
lspconfig.lua_ls.setup {}

-- Bash
lspconfig.bashls.setup {}

-- Vim
lspconfig.vimls.setup {}

-- Latex
lspconfig.texlab.setup {}
lspconfig.ltex.setup {}
