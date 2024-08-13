-- Documentation: https://github.com/neovim/nvim-lspconfig

return {
    {
        "MunifTanjim/eslint.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- C & CPP
            lspconfig.clangd.setup {}

            -- Python
            lspconfig.pylsp.setup {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = true,
                            },
                        },
                    },
                },
            }

            -- Web
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.cssls.setup {
                capabilities = capabilities,
            }
            lspconfig.html.setup {}
            lspconfig.emmet_ls.setup {}
            lspconfig.tsserver.setup {}

            -- C#
            lspconfig.csharp_ls.setup {
                handlers = {
                    ["textDocument/definition"] = require("csharpls_extended").handler,
                    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
                },
            }

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

            -- Rust
            lspconfig.rust_analyzer.setup {}
        end,
        keys = {
            { "gd", require("custom-functions").goToDefinition, desc = "Go To Definition" },
            { "gD", vim.lsp.buf.declaration, desc = "Go To Declaration" },
            { "<C-h>", vim.lsp.buf.hover, desc = "Mouse Hover" },
        }
    },
}
