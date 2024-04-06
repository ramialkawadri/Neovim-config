-- Documentation: https://github.com/neovim/nvim-lspconfig

-- neodev must be imported first!
require("neodev").setup {}
local lspconfig = require('lspconfig')

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
                    enabled = false,
                },
            },
        },
    },
}
lspconfig.pyright.setup {}

-- Web
lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.tsserver.setup {}

-- C#
local pid = vim.fn.getpid()
lspconfig.omnisharp.setup {
    cmd = { "omnisharp", "-lsp", "--hostPID", tostring(pid) },
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/references"] = require('omnisharp_extended').references_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
    },
    enable_import_completion = true,
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

