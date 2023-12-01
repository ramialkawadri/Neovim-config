-- Documentation: https://github.com/nvim-telescope/telescope.nvim

-- Search files, even hidden ones
vim.keymap.set('n', 'ff', ':lua require(\'telescope.builtin\').find_files()<CR>', {})
-- Ripgrep files, respects gitignore
vim.keymap.set('n', 'fg', ':lua require(\'telescope.builtin\').live_grep()<CR>', {})


require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "select_horizontal"
            }
        }
    }
}
