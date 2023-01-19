local hvim = require 'core.macros'

require 'core.remap'
require 'core.set'
require 'core.statusline'

hvim.init()

hvim.pack 'nyoom-engineering/oxocarbon.nvim'
hvim.pack {'nvim-lua/plenary.nvim', lazy = true}

hvim.modules('editor', {
    'comment',
    'fold', -- FIXME: Something wrong with mappings I think
})

hvim.modules('lang', {
    'golang',
    'lua',
    'typescript',
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
    'nvimtree',
    'tabs',
    'vc-gutter',
    'window-select',
})

hvim.setup()

vim.cmd.colorscheme('oxocarbon')
