return {
    "aznhe21/actions-preview.nvim",
    config = function()
        require("actions-preview").setup {
            highlight_command = {
                require("actions-preview.highlight").delta("delta --paging always")
            },
            telescope = {
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.8,
                    height = 0.9,
                    prompt_position = "top",
                    preview_cutoff = 20,
                    preview_height = function(_, _, max_lines)
                        return max_lines - 15
                    end,
                },
            },
        }
    end,
    keys = {
        {
            "<C-c>",
            mode = { "n", "v" },
            function()
                require("actions-preview").code_actions()
            end,
            desc = "Code Actions"
        },
    },
}
