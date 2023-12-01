-- Documentation: https://github.com/hrsh7th/nvim-cmp

-- completeopt is used to manage code suggestions
-- menuone: show popup even when there is only one suggestion
-- noinsert: Only insert text when selection is confirmed
-- noselect: force us to select one from the suggestions
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true}

local cmp = require('cmp')

local lsp_symbols = {
    Text = '   (Text) ',
    Method = '   (Method)',
    Function = '   (Function)',
    Constructor = '   (Constructor)',
    Field = ' ﴲ  (Field)',
    Variable = '[] (Variable)',
    Class = '   (Class)',
    Interface = ' ﰮ  (Interface)',
    Module = '   (Module)',
    Property = ' 襁 (Property)',
    Unit = '   (Unit)',
    Value = '   (Value)',
    Enum = ' 練 (Enum)',
    Keyword = '   (Keyword)',
    Snippet = '   (Snippet)',
    Color = '   (Color)',
    File = '   (File)',
    Reference = '   (Reference)',
    Folder = '   (Folder)',
    EnumMember = '   (EnumMember)',
    Constant = ' ﲀ  (Constant)',
    Struct = ' ﳤ  (Struct)',
    Event = '   (Event)',
    Operator = '   (Operator)',
    TypeParameter = '   (TypeParameter)',
}

cmp.setup({
	mapping = {
		-- Shift+TAB to go to the Previous Suggested item
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		-- Tab to go to the next suggestion
		['<Tab>'] = cmp.mapping.select_next_item(),
		-- CTRL+SHIFT+f to scroll backwards in description
		['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
		-- CTRL+F to scroll forwards in the description
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		-- CTRL+SPACE to bring up completion at current Cursor location
		['<C-Space>'] = cmp.mapping.complete(),
		-- CTRL+e to exit suggestion and close it
		['<C-e>'] = cmp.mapping.close(),
		-- CR (enter or return) to CONFIRM the currently selection suggestion
		-- We set the ConfirmBehavior to insert the Selected suggestion
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	},

	-- sources are the installed sources that can be used for code suggestions
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 3 },
		{ name = 'nvim_lsp_signature_help'},
		{ name = 'nvim_lua', keyword_length = 2},
		{ name = 'buffer', keyword_length = 2 },
		{ name = 'vsnip', keyword_length = 2 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },

    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                neorg = '[Neorg]',
            })[entry.source.name]

            return item
        end,
    }
})
