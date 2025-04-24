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
                name_formatter = function(buf)  -- buf contains:
                    if string.len(buf.name) > 22 then
                        return string.sub(buf.name, 0, 10) .. ".." .. string.sub(buf.name, -10)
                    else 
                        return buf.name
                    end
                end,
                max_name_length = 22,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },
                indicator = {
                    style = "icon",
                    icon = "┃",
                },
            },
            highlights = {
                fill = {
                    bg = "#818181",
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
