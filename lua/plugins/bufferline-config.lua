-- Documentation: https://github.com/akinsho/bufferline.nvim
local background_color = "#5d5d5f"

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup {
            options = {
                diagnostics = "nvim_lsp",
                style_preset = bufferline.style_preset.no_italic,
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                separator_style = "thick",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    }
                },
                indicator = {
                    style = "icon",
                    icon = "| "
                }
            },
            highlights = {
                fill = {
                    bg = background_color
                }
            }
        }
    end,
    keys = {
        { "<C-j>", [[:bp<CR>]], desc = "Previous Buffer" },
        { "<C-k>", [[:bn<CR>]], desc = "Next Buffer" },
        { "\\w", [[:Bdelete<CR>]], desc = "Close Current Buffer" },
    },
}
