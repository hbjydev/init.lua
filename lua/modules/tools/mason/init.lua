local hvim = require("core.macros")

hvim.pack({
    "williamboman/mason.nvim",

    event = "BufRead *",
    cmd = "Mason",

    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
    },

    config = function()
        local mlc = require("mason-lspconfig")
        local lsp = require("lspconfig")
        local on_attach = require('modules.tools.lsp.onattach').on_attach

        require("mason").setup({
            ui = {
                border = "solid",
                icons = {
                    package_installed = "",
                    package_pending = "",
                    package_uninstalled = "",
                },
            },
        })

        mlc.setup({
            ensure_installed = {
                "ansiblels",
                "bashls",
                "bufls",
                "clangd",
                "cmake",
                "cssls",
                "cssmodules_ls",
                "dockerls",
                "gopls",
                "html",
                "intelephense",
                "jsonls",
                "jsonnet_ls",
                "ltex",
                "lua_ls",
                "omnisharp",
                "perlnavigator",
                "prismals",
                "pylsp",
                "rnix",
                "rust_analyzer",
                "tailwindcss",
                "terraformls",
                "tsserver",
                "volar",
                "yamlls",
            },
        })

        local defaults = {
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
        }

        mlc.setup_handlers({
            function(server_name)
                lsp[server_name].setup(defaults)
            end,

            lua_ls = function()
                require("neodev").setup({
                    lspconfig = false,
                })

                lsp["lua_ls"].setup({
                    before_init = require("neodev.lsp").before_init,
                    on_attach = on_attach,
                    flags = { debounce_text_changes = 150 },
                })
            end,
        })
    end,
})
