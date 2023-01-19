local lsp = require('lsp-zero')

lsp.set_preferences {
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = '',
    },
}

lsp.nvim_workspace {
    library = vim.api.nvim_get_runtime_file('', true)
}
