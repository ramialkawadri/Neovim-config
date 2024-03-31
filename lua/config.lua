-- Required in multiple plugins

vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Lines configs

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

-- Vertical line

vim.cmd('set colorcolumn=100')

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

vim.cmd('set pumwidth=50')

-- Ignorecases by default

vim.cmd('set ic');

-- Folding

vim.cmd('set foldmethod=manual')

-- Alias

vim.cmd('command Codeaction lua vim.lsp.buf.code_action()')
vim.cmd('command Format lua vim.lsp.buf.format()')

-- Latex

vim.g.vimtex_quickfix_open_on_warning = 0

-- Styling

vim.g.gruvbox_number_column = "bg1";
vim.g.gruvbox_invert_selection = false;
vim.cmd('colorscheme gruvbox')
vim.cmd('hi MatchParen gui=underline guibg=None guifg=None guisp=white')
