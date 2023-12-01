-- Documentation: https://github.com/nvim-tree/nvim-tree.lua

-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
    filters = {
        custom = { '.git' },
    },

    renderer = {
        indent_markers = {
            enable = true
        }
    }
}
