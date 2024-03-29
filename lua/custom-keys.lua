-- Fetch keymap
local map = vim.api.nvim_set_keymap

-- Open / close tree
map('n', '<F3>', [[:NvimTreeOpen<CR>]], {})
map('n', '<F4>', [[:NvimTreeClose<CR>]], {})

-- Changing the bufferline using shortcut
map('n', '<C-j>', [[:bp<CR>]], {})
map('n', '<C-k>', [[:bn<CR>]], {})

-- Trouble
map('n', 'gr', [[:TroubleToggle lsp_references<CR>]],
  {silent = true, noremap = true}
)

map('n', 'gd', [[:TroubleToggle lsp_definitions<CR>]],
  {silent = true, noremap = true}
)

map('n', '<C-P>', '<cmd>TroubleToggle workspace_diagnostics<CR>',
  {silent = true, noremap = true}
)
map('n', '<C-x>', '<cmd>TroubleToggle document_diagnostics<CR>',
  {silent = true, noremap = true}
)

map('n', '<space>q', '<cmd>lua vim.diagnostic.open_float()<CR>',
  {silent = true, noremap = true})

-- File explorer
map('n', '<C-h>', ':lua require(\'nvim-tree.api\').node.open.horizontal() <CR>',
  {noremap = true}
)

-- Toggleterm
map('n', '<C-t>', '<cmd>ToggleTerm<CR>', {})
map('t', '<C-t>', '<cmd>ToggleTerm<CR>', {})

-- Clear highlighting on escape in normal mode
map('n', '<esc>', '<cmd>:noh<CR>', {})

-- Move lines up and down
map('n', '<A-j>', '<cmd>:m .+1<CR>==', {})
map('n', '<A-k>', '<cmd>:m .-2<CR>==', {})
map('i', '<A-j>', '<Esc><cmd>:m .+1<CR>==gi', {})
map('i', '<A-k>', '<Esc><cmd>:m .-2<CR>==gi', {})
map('v', '<A-j>', 'xp`[V`]', {})
map('v', '<A-k>', 'xkP`[V`]', {})

-- Latex
map('n', '<C-A-j>', '<cmd>:call SVED_Sync()<CR>', {})

-- Renamer
map('n', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- Gitsigns
map('n', 'gp', [[:Gitsigns preview_hunk<CR>]], {})
map('n', 'gs', [[:Gitsigns stage_hunk<CR>]], {})
map('n', 'gn', [[:Gitsigns next_hunk<CR>]], {})
map('n', 'gN', [[:Gitsigns prev_hunk<CR>]], {})
