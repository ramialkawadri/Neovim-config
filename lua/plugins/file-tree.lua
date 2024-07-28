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
        { "ff", require("telescope.builtin").find_files, desc = "Search Files" },
        { "fg", require("telescope.builtin").live_grep, desc = "RipGrep" },
        { "fb", require("telescope.builtin").buffers, desc = "Search Buffers" },
    },
}
