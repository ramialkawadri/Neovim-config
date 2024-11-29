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
    keys = {
        { "ff", function() require("telescope.builtin").find_files() end, desc = "Search Files" },
        { "fg", function() require("telescope.builtin").live_grep() end, desc = "RipGrep" },
        { "fb", function() require("telescope.builtin").buffers() end, desc = "Search Buffers" },
        { "fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
        { "gr", function() require("telescope.builtin").lsp_references() end, desc = "Open Buffer Diagnostics" },
    },
}
