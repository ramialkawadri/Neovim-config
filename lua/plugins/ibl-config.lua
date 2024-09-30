return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
    require("ibl").setup()
    local highlight = {
        "SelectedIndentationColor",
    }
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "SelectedIndentationColor", { fg = "#5d87ac" })
    end)

    require("ibl").setup { scope = { highlight = highlight } }
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
