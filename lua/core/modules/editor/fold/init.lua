local hvim = require('core.macros')

hvim.pack {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'kevinhwang91/promise-async',
    },

    event = "BufRead",

    opts = {
        provider_selector = function (_, _, _)
            return { "treesitter", "indent" }
        end
    },
}
