-- Documentation: https://github.com/akinsho/bufferline.nvim

local bufferline = require('bufferline')
local background_color = "#5d5d5f"

bufferline.setup {
    options = {
        diagnostics = 'nvim_lsp',
        style_preset = bufferline.style_preset.no_italic,
        diagnostics_indicator = function(count, level)
            local icon = level:match('error') and ' ' or ' '
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
