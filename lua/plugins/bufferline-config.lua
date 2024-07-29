-- Documentation: https://github.com/akinsho/bufferline.nvim
local background_color = "#5d5d5f"
local selected_buffer_bg = "#2e3031"

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
                    bg = selected_buffer_bg,
                },
                diagnostic_selected = {
                    bg = selected_buffer_bg,
                },
                hint_selected = {
                    bg = selected_buffer_bg,
                },
                hint_diagnostic_selected = {
                    bg = selected_buffer_bg,
                },
                info_selected = {
                    bg = selected_buffer_bg,
                },
                info_diagnostic_selected = {
                    bg = selected_buffer_bg,
                },
                warning_selected = {
                    bg = selected_buffer_bg,
                },
                warning_diagnostic_selected = {
                    bg = selected_buffer_bg,
                },
                error_selected = {
                    bg = selected_buffer_bg,
                },
                error_diagnostic_selected = {
                    bg = selected_buffer_bg,
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
