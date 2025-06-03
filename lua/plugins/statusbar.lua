return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
        options = {
            disabled_filetypes = {
                "NvimTree",
            },
            section_separators = { right = "", left = ""},
        },
        sections = {
            lualine_a = {
                "mode",
            },
            lualine_b = {
                "branch",
                require("custom-functions").get_buffer_relative_path,
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
                function()
                    return require("lsp-progress").progress()
                end,
                "filetype",
            },
            lualine_z = {
                "location",
            },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
    }
}

