-- Documentation: https://github.com/williamboman/mason.nvim

require('mason').setup {}

require('mason-lspconfig').setup {
    ensure_installed = {
        -- LSP:
        "clangd",                           -- C/CPP
        "html",                             -- HTML
        "cssls",                            -- CSS
        "emmet_ls",                         -- Emmet
        "jsonls",                           -- JSON
        "lua_ls",                           -- Lua
        "pylsp",                            -- Python
        "pyright",                          -- Pyright
        "tsserver",                         -- Typescript
        "cmake",                            -- CMake
        "bashls",                           -- Bash
        "jdtls",                            -- Java
        "vimls",                            -- Vim
        "texlab",                           -- Latex
        "ltex",                             -- Latex
    }
}

-- TODO: install inters: https://github.com/mfussenegger/nvim-lint
