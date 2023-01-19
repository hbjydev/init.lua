local hvim = require('core.macros')

hvim.pack {
    'neovim/nvim-lspconfig',

    event = "BufRead *",
    cmd = {
        "LspInfo",
        "LspLog",
        "LspRestart",
        "LspStart",
        "LspStop",
    },

    dependencies = {
        'j-hui/fidget.nvim',
        'williamboman/mason.nvim',
        'jose-elias-alvarez/null-ls.nvim',
    },

    config = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next, opts)

        require('fidget').setup {}
    end,
}
