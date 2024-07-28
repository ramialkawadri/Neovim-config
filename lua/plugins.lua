-- Documentation: https://github.com/wbthomason/packer.nvim

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "jay-babu/mason-null-ls.nvim"
    use "nvimtools/none-ls.nvim"
    -- Java
    use "mfussenegger/nvim-jdtls"
    -- Hrsh7th Code Completion Suite
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    -- LspKind
    use "onsails/lspkind.nvim"
    -- C#
    use "Decodetalkers/csharpls-extended-lsp.nvim"
    -- Lua
    use "folke/neodev.nvim"
    -- Actions preview
    use "aznhe21/actions-preview.nvim"
    -- Gitsigns
    use "lewis6991/gitsigns.nvim"
    -- Repeate
    use "tpope/vim-repeat"
    -- Nvim color highlight
    use "brenoprata10/nvim-highlight-colors"
    -- Indent blankline
    use "lukas-reineke/indent-blankline.nvim"
    -- Rainbow-delimiters
    use "HiPhish/rainbow-delimiters.nvim"
    -- eslint
    use "MunifTanjim/eslint.nvim"
    -- Autotag
    use "windwp/nvim-ts-autotag"
    -- Startify
    use "mhinz/vim-startify"
    -- Vim bbye
    use "moll/vim-bbye"
    -- Vim surrond
    use "tpope/vim-surround"
    -- Themes
    use "rafi/awesome-vim-colorschemes"
    use "projekt0n/github-nvim-theme"
    -- Autopairs
    use "windwp/nvim-autopairs"
    -- Comments
    use "numToStr/Comment.nvim"
    -- VimText
    use "lervag/vimtex"
    -- Testing
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "Issafalcon/neotest-dotnet",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-jest",
            "rcasia/neotest-java",
        }
    }
    use {
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
    }
    -- Debugging
    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    }
    -- Renamer
    use {
        "filipdutescu/renamer.nvim",
        branch = "master",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    -- File explorer tree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
    }
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    -- Lualine information / Status bar
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    -- Todo comments
    use {
        "folke/todo-comments.nvim",
        require = "nvim-lua/plenary.nvim"
    }
    -- Bufferline
    use {
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "nvim-tree/nvim-web-devicons"
    }
    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }
    -- Toggleterm
    use {
        "akinsho/toggleterm.nvim",
        tag = "*"
    }
    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- LazyGit
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
end)
