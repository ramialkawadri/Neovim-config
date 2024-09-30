return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local highlight = {
            "SelectedIndentationColor",
        }
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "SelectedIndentationColor", { fg = "#5d87ac" })
        end)

        require("ibl").setup {
            scope = {
                highlight = highlight,
                show_start = false,
                show_end = false,
            }
        }
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
