vim.wo.spell = false

return {
    "kamykn/spelunker.vim",
    lazy = false,
    keys = {
        { "z=", function() vim.cmd [[call spelunker#correct_from_list()]] end, desc = "Spell suggestion" },
        { "zn", function() vim.cmd [[call spelunker#jump_next()]] end,         desc = "Jump to next misspelled word" },
        { "zN", function() vim.cmd [[call spelunker#jump_prev()]] end,         desc = "Jump to previous misspelled word" },
    },
}
