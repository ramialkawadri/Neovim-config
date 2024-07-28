local map = vim.keymap.set
local defaultMapOptions = {
    silent = true,
    noremap = true
}

-- TODO: look at this for default keys: https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings

-- Changing the bufferline using shortcut

map("n", "<C-j>", [[:bp<CR>]], defaultMapOptions)
map("n", "<C-k>", [[:bn<CR>]], defaultMapOptions)
map("n", "\\w", [[:Bdelete<CR>]], defaultMapOptions)


-- Definition and declaration

map("n", "gd", custom_functions.goToDefinition, defaultMapOptions)
map("n", "gD", vim.lsp.buf.declaration, defaultMapOptions)

-- Vim diagnostic

map("n", "<space>q", vim.diagnostic.open_float, defaultMapOptions)

-- Toggleterm

map("n", "<C-t>", "<cmd>ToggleTerm<CR>", defaultMapOptions)
map("t", "<C-t>", "<cmd>ToggleTerm<CR>", defaultMapOptions)

-- Clear highlighting on escape in normal mode

map("n", "<esc>", "<cmd>:noh<CR>", defaultMapOptions)

-- Move lines up and down

map("n", "<A-j>", "<cmd>:m .+1<CR>==", defaultMapOptions)
map("n", "<A-k>", "<cmd>:m .-2<CR>==", defaultMapOptions)
map("i", "<A-j>", "<Esc><cmd>:m .+1<CR>==gi", defaultMapOptions)
map("i", "<A-k>", "<Esc><cmd>:m .-2<CR>==gi", defaultMapOptions)
map("v", "<A-j>", "xp`[V`]", defaultMapOptions)
map("v", "<A-k>", "xkP`[V`]", defaultMapOptions)


-- Auto complete

map("n", "<C-h>", vim.lsp.buf.hover, defaultMapOptions)

-- LazyGit

map("n", "<C-g>", [[:LazyGit<CR>]], defaultMapOptions)