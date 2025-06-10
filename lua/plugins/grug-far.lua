return {
    "MagicDuck/grug-far.nvim",
    keys = {
        {
            "<leader>f",
            mode = { "n", "v" },
            function() require('grug-far').open() end,
            desc = "Open search"
        }
    }
}
