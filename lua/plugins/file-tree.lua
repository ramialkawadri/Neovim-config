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
        },
        filters = {
            dotfiles = false,
            git_ignored = false,
        },
        live_filter = {
            always_show_folders = false,
        },
        actions = {
            open_file = {
                resize_window = false,
            },
        },
        view = {
            -- Automatically resize.
            width = {},
        },

    },
    keys = {
        { "<F3>", function() require("nvim-tree.api").tree.open() end,  desc = "Open File Tree" },
        { "<F4>", function() require("nvim-tree.api").tree.close() end, desc = "Close File Tree" },
    },
}
