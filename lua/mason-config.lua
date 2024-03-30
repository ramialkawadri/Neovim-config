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
        "csharp_ls",                        -- C#
        "omnisharp",                        -- C#
        "jdtls",                            -- Java
        "rust_analyzer",                    -- Rust
        "vimls",                            -- Vim
        "texlab",                           -- Latex
        "ltex",                             -- Latex
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

