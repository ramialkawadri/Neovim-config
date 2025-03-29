local map = vim.keymap.set
local defaultMapOptions = { silent = true, noremap = true }

-- Vim diagnostic

map("n", "<space>q", vim.diagnostic.open_float, defaultMapOptions)

-- Clear highlighting on escape in normal mode

map("n", "<esc>", "<cmd>:noh<CR>", defaultMapOptions)

-- Move lines up and down

map("n", "<A-j>", "<cmd>:m .+1<CR>==", defaultMapOptions)
map("n", "<A-k>", "<cmd>:m .-2<CR>==", defaultMapOptions)
map("i", "<A-j>", "<Esc><cmd>:m .+1<CR>==gi", defaultMapOptions)
map("i", "<A-k>", "<Esc><cmd>:m .-2<CR>==gi", defaultMapOptions)
map("v", "<A-j>", "xp`[V`]", defaultMapOptions)
map("v", "<A-k>", "xkP`[V`]", defaultMapOptions)

-- LazyGit

map("n", "<C-g>", [[:LazyGit<CR>]], defaultMapOptions)

-- Buffers

map("n", "\\w", [[:Bdelete<CR>]], defaultMapOptions)
