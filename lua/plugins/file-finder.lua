return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "prochri/telescope-all-recent.nvim",
        -- Required by the all recent extension
        "kkharji/sqlite.lua",
    },
    config = function()
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {},
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
                },
            },
            defaults = {
                path_display = { truncate = 8 },
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
        }

        require("telescope").load_extension("ui-select")

        -- Load this after other extensions.
        vim.g.sqlite_clib_path = vim.env.sqlite_clib_path
        require("telescope-all-recent").setup({
            vim_ui_select = {
                kinds = {
                    overseer_template = {
                        use_cwd = true,
                        prompt = "Task template",
                        name_include_prompt = true,
                    },
                }, 
                prompts = {
                    ["Configuration: "] = {
                        use_cwd = true,
                    }
                }
            }
        })
    end,
    lazy = false,
    keys = {
        { "ff", function() require("telescope.builtin").find_files() end,     desc = "Search Files" },
        { "fg", function() require("telescope.builtin").live_grep() end,      desc = "RipGrep" },
        { "fb", function() require("telescope.builtin").buffers() end,        desc = "Search Buffers" },
        { "fh", function() require("telescope.builtin").help_tags() end,      desc = "Help Tags" },
        { "fr", function() require("telescope.builtin").registers() end,      desc = "Open Buffer Diagnostics" },
        { "fm", function() require("telescope.builtin").marks() end,          desc = "Open Buffer Diagnostics" },
        { "gr", function() require("telescope.builtin").lsp_references() end, desc = "Open Buffer Diagnostics" },
    },
}
