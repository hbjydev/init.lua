require'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,

            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },

            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
        },
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
    },

    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "go",
        "typescript",
        "javascript",
        "help",
        "json",
        "yaml",
        "python",
        "nix",
        "php",
        "bash",
        "css",
        "cmake",
        "dockerfile",
        "git_rebase",
        "gitcommit",
        "gomod",
        "gowork",
        "hcl",
        "html",
        "jq",
        "jsdoc",
        "latex",
        "make",
        "markdown",
        "phpdoc",
        "prisma",
        "proto",
        "rego",
        "toml",
        "tsx",
    },
}
