local hvim = require("core.macros")

hvim.pack({
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    build = ":TSUpdate",

    event = "BufRead",

    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,

                    goto_next_start = {
                        ["]f"] = "@function.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                    },

                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                    },
                },

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
                        ["@parameter.outer"] = "v", -- charwise
                        ["@function.outer"] = "V", -- linewise
                        ["@class.outer"] = "<c-v>", -- blockwise
                    },
                },
            },

            sync_install = false,

            auto_install = true,
            ignore_install = {
                "help",
            },

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
                "jsonc",
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
                "fennel",
            },
        })

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.river = {
            install_info = {
                url = "https://github.com/grafana/tree-sitter-river",
                files = { "src/parser.c" },
            },
            filetype = "river",
        }

        vim.treesitter.language.register('river', 'river')
    end,
})
