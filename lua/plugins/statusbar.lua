-- Documentation: https://github.com/nvim-lualine/lualine.nvim

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
        disabled_filetypes = {
            statusline = { "NVimTree" },
            winbar = { "NVimTree" },
        },
        sections = {
            lualine_a = { { 'mode', padding = 1 } },
            lualine_b = { 'filename', 'branch' },
            lualine_c = { '%=', },
            lualine_x = {},
            lualine_y = { 'filetype', },
            lualine_z = { { 'location', padding = 1 } },
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
