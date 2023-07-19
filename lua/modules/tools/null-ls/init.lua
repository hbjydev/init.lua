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
            },
            handlers = {},
        })

        null_ls.setup {
            should_attach = function (bufnr)
                return vim.api.nvim_buf_get_name(bufnr):match("^.env")
            end
        }
    end,
})
