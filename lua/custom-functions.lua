local M = {}

function M.goToDefinition()
    if vim.bo.filetype == "cs" then
        require("csharpls_extended").lsp_definitions()
    else
        vim.lsp.buf.definition()
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
    else
        return false
    end
end

function M.load_coverage()
    vim.cmd("CoverageClear")
    vim.cmd("Coverage")
end

function M.show_coverage_summary()
    M.load_coverage()
    vim.cmd("CoverageSummary")
end

function M.return_if_exists_else_ask(path)
    if M.file_exists(path) then
        return path
    else
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end
end

function M.get_folder_name(path)
    return string.sub(path, string.find(path, "/[^/]*$") + 1)
end

function M.debug_c_or_cpp()
    vim.cmd [[!g++ main.cpp -o main -g]]
    return M.return_if_exists_else_ask(vim.fn.getcwd() .. "/" .. "main")
end

function M.debug_rust()
    vim.cmd [[!cargo build]]
    return M.return_if_exists_else_ask(
        vim.fn.getcwd()
        .. "/target/debug/"
        .. M.get_folder_name(vim.fn.getcwd()))
end

return M
