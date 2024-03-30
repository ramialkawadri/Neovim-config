-- Documentation: https://github.com/neovim/nvim-lspconfig

local lspconfig = require('lspconfig')

--------------------------LSP--------------------------

-- C & CPP
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}

-- Pythin
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
lspconfig.omnisharp.setup {}
lspconfig.csharp_ls.setup {}

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
