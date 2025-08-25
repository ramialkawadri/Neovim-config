return {
    {
        "igorlfs/nvim-dap-view",
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {
            winbar = {
                default_section = "scopes",
                sections = { "scopes", "watches", "repl", "breakpoints", },
                controls = {
                    enabled = true,
                },
            },
            windows = {
                height = 0.20,
                terminal = {
                    width = 0.4,
                    position = "right",
                }
            },
            auto_toggle = true,
        },
    },
}
