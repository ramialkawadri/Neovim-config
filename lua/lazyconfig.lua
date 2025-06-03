local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { "mfussenegger/nvim-jdtls",                  lazy = true, },
        { "onsails/lspkind.nvim",                     lazy = true, },
        { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = true, },
        { "tpope/vim-repeat" },
        { "brenoprata10/nvim-highlight-colors",       opts = {} },
        { "HiPhish/rainbow-delimiters.nvim" },
        {
            "windwp/nvim-ts-autotag",
            opts = {},
        },
        {
            "mhinz/vim-startify",
            config = function()
                vim.g.startify_change_to_dir = 0
            end
        },
        { "moll/vim-bbye" },
        { "tpope/vim-surround" },
        { "numToStr/Comment.nvim",         opts = {} },
        {
            "lervag/vimtex",
            config = function()
                vim.g.vimtex_quickfix_open_on_warning = 0
                local custom_function = require("custom-functions")
                if custom_function.is_nixos() then
                    vim.g.vimtex_view_general_viewer = "papers"
                else
                    vim.g.vimtex_view_general_viewer = "SumatraPDF"
                    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
                end
            end
        },
        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            opts = {
                signs = false,
            },
        },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
            ---@module "render-markdown"
            ---@type render.md.UserConfig
            opts = {
                completions = { lsp = { enabled = true } },
            },
        },
        {
            "kdheepak/lazygit.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            keys = {
                { "<C-g>", "<cmd>LazyGit<cr>", desc = "LazyGit" }
            }
        },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        {
            "antosha417/nvim-lsp-file-operations",
            opts = {},
        },
        {
            "HoNamDuong/hybrid.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        },
        { import = "plugins", },
    },
    install = { colorscheme = { "hybrid" }, },
    checker = { enabled = false, },
    change_detection = { notify = false, },
})
