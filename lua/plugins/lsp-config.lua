return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",

            -- nvim-ufo
            "kevinhwang91/nvim-ufo",
            "kevinhwang91/promise-async",
        },
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Folding

            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
            vim.opt.foldcolumn = "0"
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
            vim.opt.foldenable = true

            -- LSP

            local lsps = {
                "bashls",
                "clangd",
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "emmet_ls",
                "eslint",
                "html",
                "jdtls",
                "ltex",
                "lua_ls",
                "texlab",
                "ts_ls",
                "vimls",
            };

            local custom_function = require("custom-functions")
            if custom_function.is_nixos() then
                table.insert(lsps, "nil_ls");
                table.insert(lsps, "hyprls");
            end

            for _, lsp in ipairs(lsps) do
                vim.lsp.config(lsp, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(lsp)
            end

            vim.lsp.config("sqlls", {
                capabilities = capabilities,
                filetypes = { "sql" },
                root_dir = function(_)
                    return vim.loop.cwd()
                end,
            })
            vim.lsp.enable("sqlls")

            vim.lsp.config("pylsp", {
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
            })
            vim.lsp.enable("pylsp")

            vim.lsp.config("jsonls", {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
            vim.lsp.enable("jsonls")

            require("ufo").setup()
        end,
        keys = {
            -- LSP keys

            { "gd", require("custom-functions").goToDefinition, desc = "Go To Definition" },
            { "gi", vim.lsp.buf.implementation, desc = "Go To Implementation" },
            { "gD", vim.lsp.buf.declaration, desc = "Go To Declaration" },
            { "<C-h>", require("custom-functions").hover, desc = "Mouse Hover" },

            -- Folds keys

            { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
            { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
        }
    },
}
