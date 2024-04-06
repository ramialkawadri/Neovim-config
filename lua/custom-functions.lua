local M = {}

function M.goToDefinition()
    if vim.bo.filetype == 'cs' then
        require('omnisharp_extended').telescope_lsp_definition()
    else
        vim.cmd('TroubleToggle lsp_definitions')
    end
end

function M.debugTest()
    require("neotest").run.run({ strategy = "dap" })
end

function M.runAllTests()
    require("neotest").run.run(vim.fn.getcwd())
end

function M.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else return false end
end

return M
