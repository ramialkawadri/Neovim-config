-- Documentation: https://github.com/nvim-lualine/lualine.nvim

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    opts = {
        disabled_filetypes = {
            statusline = { "packer", "NvimTree" },
            winbar = { "packer", "NvimTree" },
        }
    }
}