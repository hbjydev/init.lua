local hvim = require('core.macros')
local lib = require('core.lib')

hvim.pack {
    'neovim/nvim-lspconfig',

    event = "BufRead",
    cmd = {
        "LspInfo",
        "LspLog",
        "LspRestart",
        "LspStart",
        "LspStop",
    },

    config = function ()
        local lsp = require('lspconfig')
        local builtin = require('telescope.builtin')

        local lsp_servers = {}

        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = 'solid' }
        )

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = 'solid' }
        )

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

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem = {
            documentationFormat = { 'markdown', 'plaintext' },
            snippetSupport = true,
            preselectSupport = true,
            insertReplaceSupport = true,
            labelDetailsSupport = true,
            deprecatedSupport = true,
            commitCharactersSupport = true,
            tagSupport = { valueSet = { 1 } },
            resolveSupport = {
                properties = { 'documentation', 'detail', 'additionalTextEdits' },
            },
        }

        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next, opts)

        local defaults = {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
        }

        hvim.ifmodule('lua', function ()
            lsp_servers['sumneko_lua'] = {}
        end)

        hvim.ifmodule('typescript', function ()
            lsp_servers['tsserver'] = {}
        end)

        hvim.ifmodule('golang', function ()
            lsp_servers['gopls'] = {}
        end)

        for name, options in pairs(lsp_servers) do
            lsp[name].setup(lib.spread(defaults)(options))
        end
    end,
}

-- hvim.pack {
--     'VonHeikemen/lsp-zero.nvim',
--     dependencies = {
--         -- LSP Support
--         'neovim/nvim-lspconfig',
--         'williamboman/mason.nvim',
--         'williamboman/mason-lspconfig.nvim',
-- 
--         -- Autocompletion
--         'hrsh7th/nvim-cmp',
--         'hrsh7th/cmp-buffer',
--         'hrsh7th/cmp-path',
--         'saadparwaiz1/cmp_luasnip',
--         'hrsh7th/cmp-nvim-lsp',
--         'hrsh7th/cmp-nvim-lua',
-- 
--         -- Snippets
--         'L3MON4D3/LuaSnip',
-- 
--         -- Snippet Collection (Optional)
--         'rafamadriz/friendly-snippets',
-- 
--         'j-hui/fidget.nvim',
--         'jose-elias-alvarez/null-ls.nvim',
--         'jay-babu/mason-null-ls.nvim',
--     },
-- 
--     event = "BufRead",
-- 
--     config = function ()
--         local lsp = require('lsp-zero')
-- 
--         lsp.preset('recommended')
-- 
--         require('core.modules.tools.lsp.cmp')
--         require('core.modules.tools.lsp.langs')
--         require('core.modules.tools.lsp.null_ls')
--         require('core.modules.tools.lsp.prefs')
--         require('core.modules.tools.lsp.onattach')
-- 
--         lsp.setup()
-- 
--         require("fidget").setup()
--     end
-- }
