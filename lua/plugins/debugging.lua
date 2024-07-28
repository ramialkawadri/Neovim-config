-- Documentation Dap: https://github.com/mfussenegger/nvim-dap
-- Documentation Dap-UI: https://github.com/rcarriga/nvim-dap-ui

return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
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

        -- C/C++

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = require("custom-functions").debug_c_or_cpp,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = require("custom-functions").debug_c_or_cpp,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
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
    end,
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "Continue Testing" },
        { "<F8>", function() require("dap").terminate() end, desc = "Terminate" },
        { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
        { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
        { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
    },
}