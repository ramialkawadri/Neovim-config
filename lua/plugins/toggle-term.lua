return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    keys = {
        { "<C-t>", mode = { "n", "t" }, function() require("toggleterm").toggle() end, desc = "Toggle Terminal" },
    },
}
