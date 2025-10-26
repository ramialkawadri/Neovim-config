vim.wo.spell = false

return {
    "kamykn/spelunker.vim",
    lazy = false,
    keys = {
        { "z=",  function() vim.cmd [[call spelunker#correct_from_list()]] end,                   desc = "Spell suggestion" },
        { "zn",  function() vim.cmd [[call spelunker#jump_next()]] end,                           desc = "Jump to next misspelled word" },
        { "zN",  function() vim.cmd [[call spelunker#jump_prev()]] end,                           desc = "Jump to previous misspelled word" },
        { "zg",  function() vim.cmd [[call spelunker#execute_with_target_word("spellgood")]] end, desc = "Spell suggestion" },
        { "zug", function() vim.cmd [[call spelunker#execute_with_target_word("spellundo")]] end, desc = "Spell suggestion" },
    },
}
