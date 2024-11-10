-- Documentation: https://github.com/williamboman/mason.nvim

return {
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "bashls",        -- Bash
                "clangd",        -- C/CPP
                "csharp_ls",     -- C#
                "cssls",         -- CSS
                "dockerls",      -- Docker
                "emmet_ls",      -- Emmet
                "eslint",        -- Eslint
                "html",          -- HTML
                "jdtls",         -- Java
                "jsonls",        -- JSON
                "ltex",          -- Spell Checking
                "lua_ls",        -- Lua
                "pylsp",         -- Python
                "rust_analyzer", -- Rust
                "texlab",        -- Latex
                "ts_ls",         -- Typescript
                "vimls",         -- Vim
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)

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
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            ensure_installed = {
                "bibtex-tidy",
                "codelldb",
                "debugpy",
                "firefox-debug-adapter",
                "js-debug-adapter",
                "netcoredbg",
                "tree-sitter-cli",
            }
        }
    }
}
