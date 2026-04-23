return {
    "seblyng/roslyn.nvim",
    ---@module "roslyn.config"
    ---@type RoslynNvimConfig
    opts = {
        filewatching = "off",
        extensions = {
            razor = {
                enabled = false,
            }
        }
    },
}
