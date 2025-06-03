-- completeopt is used to manage code suggestions
-- menuone: show popup even when there is only one suggestion
-- noinsert: Only insert text when selection is confirmed
-- noselect: force us to select one from the suggestions
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true }

-- Coloring icons.

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },
    config = function()
        local cmp = require("cmp")

        local auto_completion_width = 42

        cmp.setup({
            mapping = {
                -- Shift+TAB to go to the Previous Suggested item
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                -- Tab to go to the next suggestion
                ["<Tab>"] = cmp.mapping.select_next_item(),
                -- CTRL+b to scroll backwards in description
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                -- CTRL+f to scroll forwards in the description
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- CTRL+n to bring up completion at current Cursor location
                ["<C-n>"] = cmp.mapping.complete(),
                -- CTRL+e to exit suggestion and close it
                ["<C-e>"] = cmp.mapping.close(),
                ["<C-c>"] = cmp.mapping.abort(),
                -- CR (enter or return) to CONFIRM the currently selection suggestion
                -- We set the ConfirmBehavior to insert the Selected suggestion
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                })
            },

            -- sources are the installed sources that can be used for code suggestions
            sources = {
                { name = "path" },
                { name = "nvim_lsp",               keyword_length = 3 },
                { name = "nvim_lsp_signature_help"                    },
                { name = "nvim_lua",               keyword_length = 2 },
                { name = "buffer",                 keyword_length = 2 },
                { name = "vsnip",                  keyword_length = 2 },
                { name = 'render-markdown'                            },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            formatting = {
                expandable_indicator = true,
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Formatting.

                    local kind = require("lspkind")
                        .cmp_format({ mode = "symbol_text", maxwidth = auto_completion_width })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    -- Removing everything from the right column.
                    kind.menu = ""

                    -- Maximising the width.

                    vim_item.abbr = string.format("%-" .. tostring(auto_completion_width) .. "s", vim_item.abbr)
                    if string.len(vim_item.abbr) > auto_completion_width then
                        vim_item.abbr = string.sub(vim_item.abbr, 0, auto_completion_width - 3) .. "..."
                    end
                    return kind
                end,
            },
        })

        -- `/` cmdline setup.
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" }
                    }
                }
            })
        })
    end
}
