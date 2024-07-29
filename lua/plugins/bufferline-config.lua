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
                show_tab_indicators = false,
                show_close_icon = false,
                show_buffer_close_icons = false,
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                separator_style = { "", "" },
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
                    icon = "❚"
                },
            },
            highlights = {
                fill = {
                    bg = background_color
                },
                buffer_selected = {
                    bg = "#333536",
                },
                diagnostic_selected = {
                    bg = "#333536",
                },
                hint_selected = {
                    bg = "#333536",
                },
                hint_diagnostic_selected = {
                    bg = "#333536",
                },
                info_selected = {
                    bg = "#333536",
                },
                info_diagnostic_selected = {
                    bg = "#333536",
                },
                warning_selected = {
                    bg = "#333536",
                },
                warning_diagnostic_selected = {
                    bg = "#333536",
                },
                error_selected = {
                    bg = "#333536",
                },
                error_diagnostic_selected = {
                    bg = "#333536",
                },
                indicator_selected = {
                    fg = "#2776b9",
                },
            }
        }
    end,
    keys = {
        { "<C-j>", [[:bp<CR>]], desc = "Previous Buffer" },
        { "<C-k>", [[:bn<CR>]], desc = "Next Buffer" },
        { "\\w", [[:Bdelete<CR>]], desc = "Close Current Buffer" },
    },
}
