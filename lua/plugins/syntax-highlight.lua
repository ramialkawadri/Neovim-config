return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local custom_function = require("custom-functions")

        require("nvim-treesitter.configs").setup {
            -- A list of parser names, or "all"
            ensure_installed = not custom_function.is_nixos() and "all" or {},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = not custom_function.is_nixos(),

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
            },

            rainbow = {
                enable = true
            },

            autotag = {
                enable = true
            },

            indent = {
                enable = false
            },
        }
    end
}

