-- Documentation: https://github.com/folke/trouble.nvim_lsp
return {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        action_keys = {
            jump = { "<tab>", "<2-leftmouse>" },
            jump_close = { "<cr>" }
        }
    },
    keys = {
        { "\\p", [[:Trouble diagnostics focus=true<CR>]], desc = "Open Project Diagnostics" },
        { "\\x", [[:Trouble diagnostics focus filter.buf=0<CR>]], desc = "Open Buffer Diagnostics" },
    },
}
