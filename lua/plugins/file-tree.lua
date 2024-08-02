-- Documentation: https://github.com/nvim-tree/nvim-tree.lua

-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        renderer = {
            indent_markers = {
                enable = true
            }
        }
    },
    keys = {
        { "<F3>", [[:NvimTreeOpen<CR>]], desc = "Open File Tree" },
        { "<F4>", [[:NvimTreeClose<CR>]], desc = "Close File Tree" },
    },
}
