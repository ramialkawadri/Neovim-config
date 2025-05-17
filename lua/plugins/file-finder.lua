return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        pickers = {
            find_files = {
                find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
            },
        },
        defaults = {
            path_display = { "smart" },
            mappings = {
                i = {
                    ["<C-s>"] = "select_horizontal",
                    ["<C-w>"] = "select_vertical",
                },
                n = {
                    ["<C-s>"] = "select_horizontal",
                    ["<C-w>"] = "select_vertical",
                }
            }
        }
    },
    keys = {
        { "ff", function() require("telescope.builtin").find_files() end,     desc = "Search Files" },
        { "fg", function() require("telescope.builtin").live_grep() end,      desc = "RipGrep" },
        { "fb", function() require("telescope.builtin").buffers() end,        desc = "Search Buffers" },
        { "fh", function() require("telescope.builtin").help_tags() end,      desc = "Help Tags" },
        { "fr", function() require("telescope.builtin").registers() end, desc = "Open Buffer Diagnostics" },
        { "fm", function() require("telescope.builtin").marks() end, desc = "Open Buffer Diagnostics" },
        { "gr", function() require("telescope.builtin").lsp_references() end, desc = "Open Buffer Diagnostics" },
    },
}
