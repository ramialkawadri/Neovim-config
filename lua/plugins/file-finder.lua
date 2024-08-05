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
    keys = {
        { "ff", require("telescope.builtin").find_files, desc = "Search Files" },
        { "fg", require("telescope.builtin").live_grep, desc = "RipGrep" },
        { "fb", require("telescope.builtin").buffers, desc = "Search Buffers" },
        { "fh", require("telescope.builtin").help_tags, desc = "Help Tags" },
        { "gr", require("telescope.builtin").lsp_references, desc = "Open Buffer Diagnostics" },
    },
}
