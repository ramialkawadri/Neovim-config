return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {},
    keys = {
        { "gp", [[:Gitsigns preview_hunk<CR>]], desc = "Git Preview Hunk" },
        { "gs", [[:Gitsigns stage_hunk<CR>]], desc = "Git Stage Hunk" },
        { "gn", [[:Gitsigns next_hunk<CR>]], desc = "Git Next Hunk" },
        { "gN", [[:Gitsigns prev_hunk<CR>]], desc = "Git Previous Hunk" },
        { "gl", [[:Gitsigns blame_line<CR>]], desc = "Git Blame Line" },
        { "grh", [[:Gitsigns reset_hunk<CR>]], desc = "Git Rest Hunk" },
    },
}
