return {
    "filipdutescu/renamer.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- The next line must exist
        require("renamer.mappings.utils")
        require("renamer").setup()
    end,
    keys = {
        {
            "<F2>",
            mode = { "i", "n" },
            function()
                require("renamer").rename({})
            end,
            desc = "Rename"
        },
    },
}
