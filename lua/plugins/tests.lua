-- Documentation neotest: https://github.com/nvim-neotest/neotest
-- Documentation neotest-dotnet: https://github.com/Issafalcon/neotest-dotnet
-- Documentation nvim-coverage: https://github.com/andythigpen/nvim-coverage

local custom_functions = require("custom-functions")

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
        end,
        keys = {
            { "\\a", custom_functions.runAllTests, desc = "Run All Tests" },
            { "\\l", custom_functions.debugTest, desc = "Debug Test" },
            { "\\o", [[:Neotest output<CR>]], desc = "Show Test Output" },
        },
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {},
        keys = {
            { "\\c", custom_functions.load_coverage, desc = "Load Coverage" },
            { "\\s", custom_functions.show_coverage_summary, desc = "Show Coverage Summary" },
        },
    },
}