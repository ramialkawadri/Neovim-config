-- Documentation: https://github.com/williamboman/mason.nvim

require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "bashls",        -- Bash
        "clangd",        -- C/CPP
        "cmake",         -- CMake
        "cssls",         -- CSS
        "cssmodules_ls", -- CSS modules
        "emmet_ls",      -- Emmet
        "html",          -- HTML
        "jdtls",         -- Java
        "jsonls",        -- JSON
        "ltex",          -- Latex
        "lua_ls",        -- Lua
        "csharp_ls",     -- C#
        "pylsp",         -- Python
        "rust_analyzer", -- Rust
        "texlab",        -- Latex
        "tsserver",      -- Typescript
        "eslint",        -- ESLint
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
