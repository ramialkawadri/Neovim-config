return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
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
                "latex",
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
            },

            ignore_install = {},

            modules = {},

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
            },

            rainbow = {
                enable = true
            },

            indent = {
                enable = false
            },
        }
    end
}

