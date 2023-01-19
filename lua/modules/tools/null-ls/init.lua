local hvim = require('core.macros')

hvim.pack {
    'jose-elias-alvarez/null-ls.nvim',

    event = "BufRead *",

    dependencies = {
        'williamboman/mason.nvim',
        'jay-babu/mason-null-ls.nvim',
    },

    config = function ()
        local mason_null_ls = require('mason-null-ls')

        mason_null_ls.setup {
            ensure_installed = {
                'commitlint',
                'flake8',
                'gofumpt',
                'golangci-lint',
                'golines',
                'gomodifytags',
                'gotests',
                'phpcs',
                'phpstan',
                'shellcheck',
                'tflint',
                'yamllint',
            },
            automatic_setup = true,
        }

        mason_null_ls.setup_handlers {}

        require('null-ls').setup()
    end,
}
