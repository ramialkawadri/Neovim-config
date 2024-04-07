-- Documentation: https://github.com/williamboman/mason.nvim

require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "bashls",        -- Bash
        "clangd",        -- C/CPP
        "cmake",         -- CMake
        "cssls",         -- CSS
        "emmet_ls",      -- Emmet
        "html",          -- HTML
        "jdtls",         -- Java
        "jsonls",        -- JSON
        "ltex",          -- Latex
        "lua_ls",        -- Lua
        "csharp_ls",     -- C#
        "pylsp",         -- Python
        "pyright",       -- Pyright
        "rust_analyzer", -- Rust
        "texlab",        -- Latex
        "tsserver",      -- Typescript
        "vimls",         -- Vim
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {

        virtual_text = {
            severity = vim.diagnostic.severity.ERROR,
        },

        signs = false,

        -- delay update diagnostics
        update_in_insert = false,
    }
)
