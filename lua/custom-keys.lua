local map = vim.keymap.set
local custom_functions = require("custom-functions")
local defaultMapOptions = {
    silent = true,
    noremap = true
}

-- Open / close tree

map("n", "<F3>", [[:NvimTreeOpen<CR>]], defaultMapOptions)
map("n", "<F4>", [[:NvimTreeClose<CR>]], defaultMapOptions)

-- Changing the bufferline using shortcut

map("n", "<C-j>", [[:bp<CR>]], defaultMapOptions)
map("n", "<C-k>", [[:bn<CR>]], defaultMapOptions)
map("n", "\\w", [[:Bdelete<CR>]], defaultMapOptions)

-- Trouble

map("n", "gr", [[:Trouble lsp_references focus<CR>]], defaultMapOptions)
map("n", "gd", custom_functions.goToDefinition, defaultMapOptions)
map("n", "\\p", "<cmd>Trouble diagnostics focus=true<CR>", defaultMapOptions)
map("n", "\\x", "<cmd>Trouble diagnostics focus filter.buf=0<CR>", defaultMapOptions)

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

-- Latex

map("n", "<C-A-j>", "<cmd>:call SVED_Sync()<CR>", defaultMapOptions)

-- Renamer

map({ "i", "n" }, "<F2>", require("renamer").rename, defaultMapOptions)

-- Gitsigns

map("n", "gp", [[:Gitsigns preview_hunk<CR>]], defaultMapOptions)
map("n", "gs", [[:Gitsigns stage_hunk<CR>]], defaultMapOptions)
map("n", "gn", [[:Gitsigns next_hunk<CR>]], defaultMapOptions)
map("n", "gN", [[:Gitsigns prev_hunk<CR>]], defaultMapOptions)

-- Testing

map("n", "\\a", require("custom-functions").runAllTests, defaultMapOptions)
map("n", "\\l", require("custom-functions").debugTest, defaultMapOptions)

-- Nvim-Tree

-- Search files, even hidden ones
map("n", "ff", require("telescope.builtin").find_files, defaultMapOptions)
-- Ripgrep files, respects gitignore
map("n", "fg", require("telescope.builtin").live_grep, defaultMapOptions)
-- Buffers
map("n", "fb", require("telescope.builtin").buffers, defaultMapOptions)

-- Auto complete

map("n", "<C-h>", vim.lsp.buf.hover, defaultMapOptions)

-- LazyGit

map("n", "<C-g>", [[:LazyGit<CR>]], defaultMapOptions)

-- Actions Preview

map({ "v", "n" }, "<C-c>", require("actions-preview").code_actions, defaultMapOptions)

-- Debugging

map("n", "<F5>", require("dap").continue, defaultMapOptions)
map("n", "<F2>", require("dap").terminate, defaultMapOptions)
map("n", "<F9>", require("dap").toggle_breakpoint, defaultMapOptions)
map("n", "<F10>", require("dap").step_over, defaultMapOptions)
map("n", "<F11>", require("dap").step_into, defaultMapOptions)
map("n", "<F12>", require("dap").step_out, defaultMapOptions)

-- Coverage

map("n", "\\c", custom_functions.load_coverage, defaultMapOptions)
map("n", "\\s", custom_functions.show_coverage_summary, defaultMapOptions)
