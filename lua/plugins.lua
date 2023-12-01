-- Documentation: https://github.com/wbthomason/packer.nvim

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-jdtls'
    -- Hrsh7th Code Completion Suite
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    -- Gitsigns
    use 'lewis6991/gitsigns.nvim'
    -- Nvim color highlight
    use 'brenoprata10/nvim-highlight-colors'
    -- Inden blankline
    use 'lukas-reineke/indent-blankline.nvim'
    -- TS-rainbow
    use 'p00f/nvim-ts-rainbow'
    -- Autotag
    use 'windwp/nvim-ts-autotag'
    -- Startify
    use 'mhinz/vim-startify'
    -- Vim bbye
    use 'moll/vim-bbye'
    -- Vim surrond
    use 'tpope/vim-surround'
    -- Themes
    use 'rafi/awesome-vim-colorschemes'
    use 'projekt0n/github-nvim-theme'
    -- Autopairs
    use 'windwp/nvim-autopairs'
    -- Comments
    use 'numToStr/Comment.nvim'
    -- VimText
    use 'lervag/vimtex'
    -- File explorer tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install')
            .update({ with_sync = true })
            ts_update()
        end,
    }
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Lualine information / Status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Todo comments
    use {
        'folke/todo-comments.nvim',
        require = 'nvim-lua/plenary.nvim'
    }
    -- Bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    -- Trouble
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    }
    --Toggleterm
    use {
        'akinsho/toggleterm.nvim',
        tag = '*'
    }
end)
