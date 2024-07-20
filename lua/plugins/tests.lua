-- Documentation neotest: https://github.com/nvim-neotest/neotest
-- Documentation neotest-dotnet: https://github.com/Issafalcon/neotest-dotnet
-- Documentation nvim-coverage: https://github.com/andythigpen/nvim-coverage

require("neotest").setup({
    adapters = {
        -- require("neotest-java"),
        require("neotest-jest"),
        require("neotest-python"),
        require("neotest-dotnet"),
    }
})

require("coverage").setup {}
