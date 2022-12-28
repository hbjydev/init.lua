local null_ls = require('null-ls')
local mason_null_ls = require('mason-null-ls')

mason_null_ls.setup {
    ensure_installed = {
        'flake8',
        'gofumpt',
        'golangci-lint',
        'golines',
        'gomodifytags',
        'gotests',
        'markdownlint',
        'phpcs',
        'phpstan',
        'shellcheck',
        'tflint',
        'yamllint',
    },
    automatic_setup = true,
}

mason_null_ls.setup_handlers()

null_ls.setup()
