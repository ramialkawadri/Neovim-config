return {
    "nvim-pack/nvim-spectre",
    dependencies = "nvim-lua/plenary.nvim",
    config = {
        is_insert_mode = true,
        use_trouble_qf = true,
    },
    keys = {
        { "<leader>f", function () require("spectre").toggle() end, desc = "Open search" }
    }
}
