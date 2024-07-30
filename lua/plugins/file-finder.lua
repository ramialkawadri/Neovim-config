-- Documentation: https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = {
            path_display = { "smart" },
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
    -- TODO: move
    keys = {
        { "<F3>", [[:NvimTreeOpen<CR>]], desc = "Open File Tree" },
        { "<F4>", [[:NvimTreeClose<CR>]], desc = "Close File Tree" },
    },
}
