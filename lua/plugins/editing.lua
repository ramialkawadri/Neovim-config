-- Text editing helpers

return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()

            -- Insert `(` after selecting a function/method completion item
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    { "tpope/vim-repeat" },
    { "windwp/nvim-ts-autotag", opts = {} },
    {
        "tpope/vim-surround",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    { "numToStr/Comment.nvim", opts = {} },
    {
        "nmac427/guess-indent.nvim",
        lazy = false,
        config = function()
            vim.opt.tabstop = 4
            vim.opt.softtabstop = 4
            vim.opt.shiftwidth = 4
            vim.opt.expandtab = true
            require("guess-indent").setup {}
        end,
    },
}
