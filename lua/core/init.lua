local hvim = require 'core.macros'

require 'core.remap'
require 'core.set'
require 'core.statusline'

hvim.init()

hvim.pack 'nyoom-engineering/oxocarbon.nvim'
hvim.pack 'nvim-lua/plenary.nvim'

hvim.modules('editor', {
    'comment',
})

hvim.modules('tools', {
    'debugger',
    'docker',
    'editorconfig',
    'lsp',
    'pastebin',
    'telescope',
    'tree-sitter',
})

hvim.modules('ui', {
    'dashboard',
    'hvim',
    'hydra',
    'nvimtree',
    'tabs',
    'vc-gutter',
    'window-select',
})

hvim.setup()

vim.cmd.colorscheme('oxocarbon')
