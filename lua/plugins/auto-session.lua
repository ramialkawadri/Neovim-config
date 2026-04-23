return {
    "rmagatti/auto-session",
    lazy = false,

    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {},

    config = function(_, opts)
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

        -- Persist folds across buffer opens
        vim.api.nvim_create_autocmd("BufWinLeave", {
            pattern = "*.*",
            desc = "Save view (folds) when closing file",
            command = "silent! mkview",
        })
        vim.api.nvim_create_autocmd("BufWinEnter", {
            pattern = "*.*",
            desc = "Load view (folds) when opening file",
            command = "silent! loadview",
        })

        require("auto-session").setup(opts)
    end,
}
