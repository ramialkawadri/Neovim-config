-- Documentation: https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
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
    },
    keys = {
        { "<F3>", [[:NvimTreeOpen<CR>]], desc = "Open File Tree" },
        { "<F4>", [[:NvimTreeClose<CR>]], desc = "Close File Tree" },
    },
}
