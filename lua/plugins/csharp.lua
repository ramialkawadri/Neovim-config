-- C# tooling

return {
    {
        "khoido2003/roslyn-filewatch.nvim",
        build = "nvim -l build.lua --",
        config = function()
            require("roslyn_filewatch").setup()
        end,
    },
    {
        "DestopLine/boilersharp.nvim",
        ---@type boilersharp.Config
        opts = { auto_install_xml_parser = false },
    },
    {
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
}
