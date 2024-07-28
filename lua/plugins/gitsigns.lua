return {
    "lewis6991/gitsigns.nvim",
    opts = {},
    keys = {
        { "gp", [[:Gitsigns preview_hunk<CR>]], desc = "Git Preview Hunk" },
        { "gs", [[:Gitsigns stage_hunk<CR>]], desc = "Git Stage Hunk" },
        { "gn", [[:Gitsigns next_hunk<CR>]], desc = "Git Next Hunk" },
        { "gN", [[:Gitsigns prev_hunk<CR>]], desc = "Git Previous Hunk" },
    },
}