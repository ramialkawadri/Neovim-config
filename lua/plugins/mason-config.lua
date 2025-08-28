return {
    {
        "mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = function()
            local packages = {
                "bashls",                           -- Bash
                "clangd",                           -- C/CPP
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
                "vimls",                            -- Vim
            }
            if require("custom-functions").is_nixos() then
                packages = {}
            else
                local mason_registry = require("mason-registry")
                if not mason_registry.is_installed("roslyn") then
                    mason_registry.get_package("roslyn"):install()
                end
            end

            -- Common packages
            table.insert(packages, "sqlls")  -- SQL

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
            "mason-org/mason.nvim",
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
                packages = {
                    "firefox-debug-adapter",
                    "js-debug-adapter",
                }
            end
            require("mason-null-ls").setup({
                ensure_installed = packages,
                automatic_installation = true,
            })
        end,
    }
}
