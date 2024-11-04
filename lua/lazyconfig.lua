-- Documentation: https://lazy.folke.io/

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
        -- Java
        { "mfussenegger/nvim-jdtls", lazy = true, },
        -- LspKind
        { "onsails/lspkind.nvim", lazy = true, },
        -- C#
        { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = true, },
        -- Repeat
        { "tpope/vim-repeat" },
        -- Nvim color highlight
        { "brenoprata10/nvim-highlight-colors", opts = {} },
        -- Rainbow-delimiters
        { "HiPhish/rainbow-delimiters.nvim" },
        -- Autotag
        { "windwp/nvim-ts-autotag" },
        -- Startify
        {
            "mhinz/vim-startify",
            config = function()
                vim.g.startify_change_to_dir = 0
            end
        },
        -- Vim bbye
        { "moll/vim-bbye" },
        -- Vim surrond
        { "tpope/vim-surround" },
        -- Themes
        { "rafi/awesome-vim-colorschemes", lazy = true, },
        { "projekt0n/github-nvim-theme", lazy = true, },
        -- Comments
        { "numToStr/Comment.nvim", opts = {} },
        -- VimText
        {
            "lervag/vimtex",
            config = function()
                vim.g.vimtex_quickfix_open_on_warning = 0
                vim.g.vimtex_view_general_viewer = "okular"
                vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
            end
        },
        -- Todo comments
        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            opts = {},
        },
        -- Markdown preview
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end,
            config = function()
                vim.g.mkdp_auto_close = 0
            end
        },
        -- LazyGit
        {
            "kdheepak/lazygit.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },
        -- Lazydev
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        -- Import other plugins
        { import = "plugins" },
    },
    install = { colorscheme = { "hybrid" } },
    checker = { enabled = true },
})
