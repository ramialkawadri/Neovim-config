-- Documentation: https://github.com/neovim/nvim-lspconfig

local lspconfig = require('lspconfig')

--------------------------LSP--------------------------

-- C & CPP
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}

-- Pythin
lspconfig.pylsp.setup {}
lspconfig.pyright.setup {}

-- Web
lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.tsserver.setup {}

-- Java
lspconfig.jdtls.setup {}

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
