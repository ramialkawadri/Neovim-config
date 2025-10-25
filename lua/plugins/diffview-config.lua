vim.opt.fillchars:append("diff:╱")

return {
    "sindrets/diffview.nvim",
    lazy = false,
    keys = {
    {
        "<leader>g",
        function()
            if next(require('diffview.lib').views) == nil then
                vim.cmd('DiffviewOpen')
            else
                vim.cmd('DiffviewClose')
            end
        end, desc = "LazyGit" },
    },
    opts = {
        enhanced_diff_hl = true
    }
}
