-- Documentation: https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim", version = "0.1.8",
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
    }
}