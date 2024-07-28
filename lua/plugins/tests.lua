-- Documentation neotest: https://github.com/nvim-neotest/neotest
-- Documentation neotest-dotnet: https://github.com/Issafalcon/neotest-dotnet
-- Documentation nvim-coverage: https://github.com/andythigpen/nvim-coverage

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "Issafalcon/neotest-dotnet",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-jest",
            "rcasia/neotest-java",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    -- require("neotest-java"),
                    require("neotest-jest"),
                    require("neotest-python"),
                    require("neotest-dotnet"),
                }
            })
        end
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {}
    }
}