-- Documentation: https://lazy.folke.io/

----------------------------Installing Lua----------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
    { "mfussenegger/nvim-jdtls" },
    -- LspKind
    { "onsails/lspkind.nvim" },
    -- C#
    { "Decodetalkers/csharpls-extended-lsp.nvim" },
    -- Repeate
    { "tpope/vim-repeat" },
    -- Nvim color highlight
    { "brenoprata10/nvim-highlight-colors", opts = {} },
    -- Indent blankline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- Rainbow-delimiters
    { "HiPhish/rainbow-delimiters.nvim" },
    -- Autotag
    { "windwp/nvim-ts-autotag" },
    -- Startify
    { "mhinz/vim-startify" },
    -- Vim bbye
    { "moll/vim-bbye" },
    -- Vim surrond
    { "tpope/vim-surround" },
    -- Themes
    { "rafi/awesome-vim-colorschemes" },
    { "projekt0n/github-nvim-theme" },
    -- Comments
    { "numToStr/Comment.nvim", opts = {} },
    -- VimText
    { "lervag/vimtex" },
    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {},
    },
    -- Toggleterm
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {},
    },
    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    },
    -- LazyGit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- import your plugins
    { import = "plugins" },
  },
  install = { colorscheme = { "hybrid" } },
  checker = { enabled = true },
})
----------------------------------------------------------------------