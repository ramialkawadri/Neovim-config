return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "SelectedIndentationColor", { fg = "#80a1be" })
        end)

        require("ibl").setup {
            scope = {
                highlight = {
                    "SelectedIndentationColor",
                },
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = { "startify" }
            },
        }
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
