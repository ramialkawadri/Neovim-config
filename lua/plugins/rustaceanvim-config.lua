return {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    config = function()
        ---@type rustaceanvim.Opts
        vim.g.rustaceanvim = {
            dap = {
                configuration = {
                    type = "rust-gdb",
                    name = "rust-gdb",
                    request = "launch",
                }
            }
        }
    end
}
