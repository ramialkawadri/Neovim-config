-- Required in multiple plugins

vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Lines configs

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

-- Vertical line

vim.cmd.set("colorcolumn=80")

-- Swap files

vim.opt.swapfile = false

-- Scrolloff

vim.opt.scrolloff = 5

-- Tab size

local TAB_WIDTH = 4
vim.opt.tabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true

-- Autocomplete size

vim.cmd.set("pumwidth=50")

-- Ignorecases by default

vim.cmd.set("ic");

-- Folding

vim.cmd("set foldmethod=manual")

-- Alias

vim.cmd.command("Format lua vim.lsp.buf.format()")

-- Styling

vim.cmd.colorscheme("hybrid")
vim.cmd.hi("MatchParen gui=underline guibg=None guifg=None guisp=white")
vim.cmd.hi("LineNr guifg=#70727d")
-- Required for the LuaLine: https://github.com/neovim/neovim/pull/17266
vim.opt.laststatus = 3
