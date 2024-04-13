-- Documentation Dap: https://github.com/mfussenegger/nvim-dap
-- Documentation Dap-UI: https://github.com/rcarriga/nvim-dap-ui

local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()
require("dap.ext.vscode").load_launchjs(nil, {})

-- C#
dap.adapters.netcoredbg = {
    type = "executable",
    command = "netcoredbg",
    args = { "--interpreter=vscode" }
}

dap.configurations.cs = {
    {
        type = "netcoredbg",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            vim.cmd [[!dotnet build]]

            local current_file_path = vim.api.nvim_buf_get_name(0)
            local cwd = vim.fn.getcwd()

            -- The index of the first / after cwd.
            local end_index = string.find(current_file_path, "/", string.len(cwd) + 2)
            local dll_path
            if end_index == nil then
                local project_name = string.sub(cwd, string.find(cwd, "/[^/]*$") + 1)
                dll_path = cwd .. "/bin/Debug/net8.0/" .. project_name .. ".dll"
            else
                local project_name = string.sub(current_file_path, string.len(cwd) + 2, end_index - 1)
                dll_path = cwd .. "/" .. project_name .. "/bin/Debug/net8.0/" .. project_name .. ".dll"
            end

            if require("custom-functions").file_exists(dll_path) then
                return dll_path
            else
                return vim.fn.input("Path to dll: ", dll_path, "file")
            end
        end,
    },
}

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end