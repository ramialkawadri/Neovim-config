-- Documentation: https://github.com/nvim-lualine/lualine.nvim

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    opts = {
        disabled_filetypes = {
            statusline = { "packer", "NvimTree" },
            winbar = { "packer", "NvimTree" },
        },
        options = {
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { { 'mode', separator = { left = '' }, padding = 1 } },
            lualine_b = { 'filename', 'branch' },
            lualine_c = { '%=', },
            lualine_x = {},
            lualine_y = { 'filetype', },
            lualine_z = {
                { 'location', separator = { right = '' }, padding = 1 },
            },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
    }
}
