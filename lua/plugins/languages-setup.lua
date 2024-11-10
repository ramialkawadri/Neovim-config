-- Documentation: https://github.com/neovim/nvim-lspconfig

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- C & CPP
            lspconfig.clangd.setup { 
				capabilities = capabilities,
			}

            -- Python
            lspconfig.pylsp.setup {
				capabilities = capabilities,
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
            lspconfig.cssls.setup {
                capabilities = capabilities,
            }
            lspconfig.html.setup {
				capabilities = capabilities,
			}
            lspconfig.emmet_ls.setup {
				capabilities = capabilities,
			}
            lspconfig.ts_ls.setup {
				capabilities = capabilities,
			}
            lspconfig.eslint.setup {
				capabilities = capabilities,
			}

            -- C#
            lspconfig.csharp_ls.setup {
				capabilities = capabilities,
                handlers = {
                    ["textDocument/definition"] = require("csharpls_extended").handler,
                    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
                },
            }

            -- Java
            lspconfig.jdtls.setup {
				capabilities = capabilities,
			}

            -- Json
            lspconfig.jsonls.setup {
				capabilities = capabilities,
			}

            -- Lua
            lspconfig.lua_ls.setup {
				capabilities = capabilities,
			}

            -- Bash
            lspconfig.bashls.setup {
				capabilities = capabilities,
			}

            -- Vim
            lspconfig.vimls.setup {
				capabilities = capabilities,
			}

            -- Latex
            lspconfig.texlab.setup {
				capabilities = capabilities,
			}
            lspconfig.ltex.setup {
				capabilities = capabilities,
			}

            -- Rust
            lspconfig.rust_analyzer.setup {
				capabilities = capabilities,
			}

            -- Docker
            lspconfig.dockerls.setup {}
        end,
        keys = {
            { "gd", require("custom-functions").goToDefinition, desc = "Go To Definition" },
            { "gi", vim.lsp.buf.implementation, desc = "Go To Implementation" },
            { "gD", vim.lsp.buf.declaration, desc = "Go To Declaration" },
            { "<C-h>", vim.lsp.buf.hover, desc = "Mouse Hover" },
        }
    },
}
