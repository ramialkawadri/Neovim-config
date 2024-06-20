-- Documentation: https://github.com/nvim-telescope/telescope.nvim

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-w>"] = "delete_buffer"
            },
            n = {
                ["<C-w>"] = "delete_buffer"
            }
        }
    }
}
