return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local custom_function = require("custom-functions")

        require("nvim-treesitter.configs").setup {
            -- A list of parser names, or "all"
            ensure_installed = not custom_function.is_nixos() and {
                "asm",
                "bash",
                "bibtex",
                "bicep",
                "c",
                "c_sharp",
                "cmake",
                "comment",
                "cpp",
                "css",
                "csv",
                "dart",
                "desktop",
                "diff",
                "dockerfile",
                "dot",
                "dtd",
                "editorconfig",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "html",
                "http",
                "java",
                "javadoc",
                "javascript",
                "jq",
                "jsdoc",
                "json",
                "json5",
                "jsonc",
                "kotlin",
                "lua",
                "luadoc",
                "luap",
                "make",
                "markdown",
                "markdown_inline",
                "meson",
                "nginx",
                "ninja",
                "nix",
                "passwd",
                "php",
                "powershell",
                "printf",
                "pymanifest",
                "python",
                "regex",
                "rust",
                "scss",
                "sql",
                "svelte",
                "tmux",
                "toml",
                "tsv",
                "tsx",
                "typescript",
                "typespec",
                "typoscript",
                "udev",
                "vim",
                "vimdoc",
                "vue",
                "xml",
                "yaml",
                "zig",
                "zig",
                -- "latex",
                -- NOTE: note working
                -- Non-NixOs system
            } or {},

            ignore_install = {},

            modules = {},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = not custom_function.is_nixos(),

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
            },

            rainbow = {
                enable = true
            },

            autotag = {
                enable = true
            },

            indent = {
                enable = false
            },
        }
    end
}

