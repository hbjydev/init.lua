local hvim = require("core.macros")

hvim.pack({
    "jose-elias-alvarez/null-ls.nvim",

    event = "BufRead *",

    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
    },

    config = function()
        local mason_null_ls = require("mason-null-ls")
        local null_ls = require("null-ls")

        mason_null_ls.setup({
            ensure_installed = {
                -- git
                "commitlint",

                -- python
                "isort",
                "debugpy",

                -- go
                "gofumpt",
                "golangci-lint",
                "golines",
                "gomodifytags",
                "gotests",

                -- shell
                "shellcheck",

                -- lua
                "stylua",
                "selene",

                -- terraform
                "tflint",

                -- ts/js
                "prettier",

                -- yaml
                "yamllint",

                -- rust
                "rustfmt",
            },
            handlers = {},
        })

        null_ls.setup {
            sources = {
                null_ls.builtins.code_actions.gitsigns,
            },
            should_attach = function (_)
                local is_env = vim.fn.expand("%:t") == ".env"
                return not is_env
            end
        }
    end,
})
