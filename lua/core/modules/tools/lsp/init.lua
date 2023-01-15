local hvim = require('core.macros')

hvim.pack {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',

        -- Snippet Collection (Optional)
        'rafamadriz/friendly-snippets',

        'j-hui/fidget.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'jay-babu/mason-null-ls.nvim',
    },

    event = "BufRead",

    config = function ()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')

        require('core.modules.tools.lsp.cmp')
        require('core.modules.tools.lsp.langs')
        require('core.modules.tools.lsp.null_ls')
        require('core.modules.tools.lsp.prefs')
        require('core.modules.tools.lsp.onattach')

        lsp.setup()

        require("fidget").setup()
    end
}
