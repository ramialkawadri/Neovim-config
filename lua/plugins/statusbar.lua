local standard_seperator = { left = '', right = ''}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
        disabled_filetypes = {
            statusline = { "NVimTree" },
            winbar = { "NVimTree" },
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    padding = 1,
                    separator = { right = '' },
                }
            },
            lualine_b = {
                {
                    require("custom-functions").get_buffer_relative_path,
                    color = { bg = "#5d5d5f" },
                    separator = standard_seperator,
                },
                {
                    "branch",
                    color = { bg = "#2e3031" },
                    separator = standard_seperator,
                }

            },
            lualine_c = { "%=" },
            lualine_x = {},
            lualine_y = {
                {
                    function()
                        return require('lsp-progress').progress()
                    end,
                    color = { bg = "#2e3031" },
                    separator = standard_seperator,
                },
                {
                    "filetype",
                    color = { bg = "#5d5d5f" },
                    separator = standard_seperator,
                },
            },
            lualine_z = {
                {
                    "location",
                    padding = 1,
                    separator = { left = '' },
                }
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

