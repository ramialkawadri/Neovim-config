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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { "mfussenegger/nvim-jdtls",                  lazy = true, },
        { "onsails/lspkind.nvim",                     lazy = true, },
        { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = true, },
        { "tpope/vim-repeat" },
        { "brenoprata10/nvim-highlight-colors",       opts = {} },
        { "HiPhish/rainbow-delimiters.nvim" },
        { "windwp/nvim-ts-autotag" },
        {
            "mhinz/vim-startify",
            config = function()
                vim.g.startify_change_to_dir = 0
            end
        },
        { "moll/vim-bbye" },
        { "tpope/vim-surround" },
        { "rafi/awesome-vim-colorschemes", lazy = true, },
        { "projekt0n/github-nvim-theme",   lazy = true, },
        { "numToStr/Comment.nvim",         opts = {} },
        {
            "lervag/vimtex",
            config = function()
                vim.g.vimtex_quickfix_open_on_warning = 0
                local custom_function = require("custom-functions")
                if custom_function.is_nixos() then
                    vim.g.vimtex_view_general_viewer = "okular"
                    vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
                else
                    vim.g.vimtex_view_general_viewer = "SumatraPDF"
                    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
                end
            end
        },
        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            opts = {},
        },
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app && npm install",
            ft = { "markdown" },
            config = function()
                vim.g.mkdp_auto_close = 0
            end
        },
        {
            "kdheepak/lazygit.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
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
        { import = "plugins", },
    },
    install = { colorscheme = { "hybrid" }, },
    checker = { enabled = false, },
    change_detection = { notify = false, },
})
