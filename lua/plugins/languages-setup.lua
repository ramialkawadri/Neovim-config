return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lsps = {
                "clangd",
                "cssls",
                "html",
                "emmet_ls",
                "ts_ls",
                "eslint",
                "jdtls",
                "jsonls",
                "lua_ls",
                "bashls",
                "vimls",
                "texlab",
                "ltex",
                "rust_analyzer",
                "dockerls"
            };

            for _, lsp in ipairs(lsps) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end

            lspconfig.csharp_ls.setup {
				capabilities = capabilities,
                handlers = {
                    ["textDocument/definition"] = require("csharpls_extended").handler,
                    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
                },
            }

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

            for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
                local default_diagnostic_handler = vim.lsp.handlers[method]
                vim.lsp.handlers[method] = function(err, result, context, config)
                    if err ~= nil and err.code == -32802 then
                        return
                    end
                    return default_diagnostic_handler(err, result, context, config)
                end
            end
        end,
        keys = {
            { "gd", require("custom-functions").goToDefinition, desc = "Go To Definition" },
            { "gi", vim.lsp.buf.implementation, desc = "Go To Implementation" },
            { "gD", vim.lsp.buf.declaration, desc = "Go To Declaration" },
            { "<C-h>", vim.lsp.buf.hover, desc = "Mouse Hover" },
        }
    },
}
