return {
    "MagicDuck/grug-far.nvim",
    opts = {
        
    },
    keys = {
        { "<leader>f",
            mode = { "n", "v" },
        function () require('grug-far').open() end, desc = "Open search" }
    }
}
