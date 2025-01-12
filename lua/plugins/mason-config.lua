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
        config = function(_, opts)
            local custom_function = require("custom-functions")
            local packages = {
                "bashls",                           -- Bash
                "clangd",                           -- C/CPP
                "csharp_ls",                        -- C#
                "cssls",                            -- CSS
                "docker_compose_language_service",  -- Docker compose
                "dockerls",                         -- Docker
                "emmet_ls",                         -- Emmet
                "eslint",                           -- Eslint
                "html",                             -- HTML
                "jdtls",                            -- Java
                "jsonls",                           -- JSON
                "ltex",                             -- Spell Checking
                "lua_ls",                           -- Lua
                "nil_ls",                           -- NixOs
                "pylsp",                            -- Python
                "rust_analyzer",                    -- Rust
                "texlab",                           -- Latex
                "ts_ls",                            -- Typescript
                "vimls",                            -- Vim
            }
            if custom_function.is_nixos() then
                packages = {}
            end
            require("mason-lspconfig").setup({
                ensure_installed = packages
            })

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
                -- "firefox-debug-adapter",
                "js-debug-adapter",
                "netcoredbg",
            }
        }
    }
}
