local map = vim.keymap.set
local custom_functions = require('custom-functions')

-- Open / close tree

map('n', '<F3>', [[:NvimTreeOpen<CR>]], {})
map('n', '<F4>', [[:NvimTreeClose<CR>]], {})

-- Changing the bufferline using shortcut

map('n', '<C-j>', [[:bp<CR>]], {})
map('n', '<C-k>', [[:bn<CR>]], {})

-- Trouble

map('n', 'gr', [[:TroubleToggle lsp_references<CR>]], { silent = true, noremap = true })
map('n', 'gd', custom_functions.goToDefinition, { silent = true, noremap = true })
map('n', '\\p', '<cmd>TroubleToggle workspace_diagnostics<CR>', { silent = true, noremap = true })
map('n', '\\x', '<cmd>TroubleToggle document_diagnostics<CR>', { silent = true, noremap = true })

-- Vim diagnostic

map('n', '<space>q', vim.diagnostic.open_float, { silent = true, noremap = true })

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

map('n', '<F2>', require("renamer").rename, { noremap = true, silent = true })
map('i', '<F2>', require("renamer").rename, { noremap = true, silent = true })

-- Gitsigns

map('n', 'gp', [[:Gitsigns preview_hunk<CR>]], {})
map('n', 'gs', [[:Gitsigns stage_hunk<CR>]], {})
map('n', 'gn', [[:Gitsigns next_hunk<CR>]], {})
map('n', 'gN', [[:Gitsigns prev_hunk<CR>]], {})

-- Testing

map('n', '\\a', require("custom-functions").runAllTests, {})
map('n', '\\l', require("custom-functions").debugTest, {})

-- Nvim-Tree

-- Search files, even hidden ones
map('n', 'ff', require("telescope.builtin").find_files, { noremap = true, silent = true })
-- Ripgrep files, respects gitignore
map('n', 'fg', require("telescope.builtin").live_grep, { noremap = true, silent = true })
-- Buffers
map('n', 'fb', require("telescope.builtin").buffers, { noremap = true, silent = true })

-- Auto complete

map('n', '<C-h>', vim.lsp.buf.hover, { noremap = true, silent = true })

-- LazyGit

map('n', '<C-g>', [[:LazyGit<CR>]], { silent = true, noremap = true })

-- Actions Preview

map({ "v", "n" }, "<C-c>", require("actions-preview").code_actions)

-- Debugging

map('n', '<F5>', require("dap").continue)
map('n', '<F2>', require("dap").terminate)
map('n', '<F9>', require("dap").toggle_breakpoint)
map('n', '<F10>', require("dap").step_over)
map('n', '<F11>', require("dap").step_into)
map('n', '<F12>', require("dap").step_out)

