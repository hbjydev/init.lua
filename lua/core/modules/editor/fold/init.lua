local hvim = require('core.macros')

hvim.pack {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'kevinhwang91/promise-async',
    },
    config = function ()
        local ufo = require('ufo')

        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set('n', 'zR', ufo.openAllFolds)
        vim.keymap.set('n', 'zM', ufo.closeAllFolds)

        ufo.setup {
            provider_selector = function (_, _, _)
                return { "treesitter", "indent" }
            end
        }
    end
}
