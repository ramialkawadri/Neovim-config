-- Documentation: https://github.com/akinsho/bufferline.nvim

local bufferline = require('bufferline')

bufferline.setup {
    options = {
        diagnostics = 'nvim_lsp',
        style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold
        },
        diagnostics_indicator = function(count, level)
            local icon = level:match('error') and ' ' or ' '
            return ' ' .. icon .. count
        end,
        separator_style = 'thick',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        }
    }
}
