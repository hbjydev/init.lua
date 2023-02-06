local hvim = require('core.macros')

hvim.pack {
    'williamboman/mason.nvim',

    event = "BufRead *",
    cmd = "Mason",

    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim',
    },

    config = function ()
        local mlc = require('mason-lspconfig')
        local lsp = require('lspconfig')

        require('mason').setup {
            ui = {
                border = "solid",
                icons = {
                    package_installed = "",
                    package_pending = "",
                    package_uninstalled = "",
                },
            },
        }

        mlc.setup {
            ensure_installed = {
                'ansiblels',
                'bashls',
                'bufls',
                'clangd',
                'cmake',
                'cssls',
                'cssmodules_ls',
                'dockerls',
                'gopls',
                'html',
                'intelephense',
                'jsonls',
                'jsonnet_ls',
                'ltex',
                'omnisharp',
                'perlnavigator',
                'prismals',
                'pyright',
                'rnix',
                'rust_analyzer',
                'sumneko_lua',
                'tailwindcss',
                'terraformls',
                'tsserver',
                'volar',
                'yamlls',
            },
        }

        local on_attach = function (_, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, bufopts)

            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)

            vim.keymap.set("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", bufopts)
            vim.keymap.set("n", "<leader>rr", ":Telescope lsp_references<CR>", bufopts)
        end

        local defaults = {
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
        }

        mlc.setup_handlers {
            function (server_name)
                lsp[server_name].setup(defaults)
            end,

            sumneko_lua = function()
                local neodev = require('neodev')

                neodev.setup {
                    lspconfig = false,
                }

                lsp['sumneko_lua'].setup {
                    before_init = require("neodev.lsp").before_init,
                    on_attach = on_attach,
                    flags = { debounce_text_changes = 150 },
                }
            end,
        }
    end,
}
