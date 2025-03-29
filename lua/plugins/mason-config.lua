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
        config = function()
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
                "pylsp",                            -- Python
                "rust_analyzer",                    -- Rust
                "texlab",                           -- Latex
                "ts_ls",                            -- Typescript
                "vimls",                            -- Vim
            }
            if require("custom-functions").is_nixos() then
                packages = {}
            end
            require("mason-lspconfig").setup({
                ensure_installed = packages,
                automatic_installation = false,
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
        config = function()
            local packages = {
                "bibtex-tidy",
                "debugpy",
                "firefox-debug-adapter",
                "js-debug-adapter",
                "netcoredbg",
            }
            if require("custom-functions").is_nixos() then
                packages = {}
            end
            require("mason-null-ls").setup({
                ensure_installed = packages,
                automatic_installation = true,
            })
        end,
    }
}
