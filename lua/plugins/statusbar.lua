-- Documentation: https://github.com/nvim-lualine/lualine.nvim

require("lualine").setup {
    options = {
        disabled_filetypes = {
            statusline = { "packer", "NvimTree" },
            winbar = { "packer", "NvimTree" },
        }
    }
}
