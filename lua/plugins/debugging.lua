return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        local mason_registry = require("mason-registry")
        local custom_function = require("custom-functions")
        dapui.setup()

        -- C#
        dap.adapters.netcoredbg = {
            type = "executable",
            command = "netcoredbg",
            args = { "--interpreter=vscode" },
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

                    return custom_function.return_if_exists_else_ask(dll_path)
                end,
            },
        }

        -- Firefox

        dap.adapters.firefox = {
            type = "executable",
            command = "node",
            args = { vim.fn.exepath("firefox-debug-adapter") }
        }
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "8000",
            executable = {
                command = "js-debug-adapter",
                args = { "8000" }
            }
        }

        -- Python

        if not require("custom-functions").is_nixos() then
            local debugpy = vim.fn.exepath("debugpy")
            require("dap-python").setup(debugpy)
        else
            require("dap-python").setup()
        end

        -- C/C++

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = custom_function.debug_c_or_cpp,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp

        -- Rust

        dap.adapters["rust-gdb"] = {
            type = "executable",
            command = "rust-gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }
        dap.configurations.rust = {
            {
                name = "Launch",
                type = "rust-gdb",
                request = "launch",
                program = custom_function.debug_rust,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Launch with arguments",
                type = "rust-gdb",
                request = "launch",
                program = custom_function.debug_rust,
                args = function()
                    local args_str = vim.fn.input({
                        prompt = "Arguments: ",
                    })
                    return args_str
                end,
            },
            {
                name = "Launch with input file",
                type = "rust-gdb",
                request = "launch",
                program = custom_function.debug_rust,
                args = function()
                    local args_str = vim.fn.input({
                        prompt = "File name (input.txt): ",
                    })
                    if string.len(args_str) == 0 then
                        args_str = "input.txt"
                    end
                    return "<" .. args_str
                end,
            },
        }

        vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
    lazy = false,
    keys = {
        { "<F5>",  function() require("dap").continue() end,          desc = "Continue Testing" },
        { "<F8>",  function() require("dap").terminate() end,         desc = "Terminate" },
        { "<F9>",  function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<F10>", function() require("dap").step_over() end,         desc = "Step Over" },
        { "<F11>", function() require("dap").step_into() end,         desc = "Step Into" },
        { "<F12>", function() require("dap").step_out() end,          desc = "Step Out" },
    },
}
