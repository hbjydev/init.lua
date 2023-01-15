local lsp = require('lsp-zero')
local util = require('lspconfig.util')

lsp.ensure_installed {
    "cssls",
    "cssmodules_ls",
    "bashls",
    "dockerls",
    "denols",
    "tsserver",
    "eslint",
    "sumneko_lua",
    "gopls",
    "golangci_lint_ls",
    "intelephense",
    "pyright",
    "tailwindcss",
    "terraformls",
    "rnix",
    "volar",
    "yamlls",
    "jsonls",
    "ansiblels",
    "bufls",
    "cmake",
    "prismals",
    "html",
    "ltex",
}

lsp.configure('denols', {
    root_dir = util.root_pattern('deno.json', 'deno.jsonc'),
})

lsp.configure('fennel-ls', {})
lsp.setup_servers({'fennel-ls', force = true})
