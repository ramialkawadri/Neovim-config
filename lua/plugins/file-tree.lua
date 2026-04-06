return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        auto_clean_after_session_restore = true,
        hijack_netrw_behavior = "open_current",
        popup_border_style = "",

        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            filtered_items_filter_on = "directories_and_files",
        },

        window = {
            width = 40,
            mappings = {
                ["E"] = "expand_all_subnodes",
            }
        },

        default_component_configs = {
            file_size = {
                enabled = false,
            },
        },
    },
    keys = {
        { "<F3>", function() require("neo-tree.command").execute({ action = "focus" }) end, desc = "Open File Tree" },
        { "<F4>", function() require("neo-tree.command").execute({ action = "close" }) end, desc = "Close File Tree" },
    },
}
