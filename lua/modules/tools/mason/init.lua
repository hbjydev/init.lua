local hvim = require('core.macros')

hvim.pack {
    'williamboman/mason.nvim',

    event = "BufRead *",

    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim',
    },

    config = function ()
        local mlc = require('mason-lspconfig')
        local lsp = require('lspconfig')
        local builtin = require('telescope.builtin')

        require('mason').setup {
            ui = {
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
                'denols',
                'dockerls',
                'gopls',
                'html',
                'intelephense',
                'jsonls',
                'jsonnet_ls',
                'ltex',
                'sumneko_lua',
                'omnisharp',
                'perlnavigator',
                'prismals',
                'pyright',
                'rnix',
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
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, bufopts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, bufopts)
            vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, bufopts)
            vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, bufopts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, bufopts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, bufopts)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, bufopts)
            vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, bufopts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, bufopts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, bufopts)
            vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, bufopts)
            vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, bufopts)
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
                    before_init = require("neodev.lsp").before_init
                }
            end,
        }
    end,
}
