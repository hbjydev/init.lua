local hvim = require('core.macros')

hvim.pack {
    'L3MON4D3/LuaSnip',
    event = "BufRead",

    dependencies = {
        "rafamadriz/friendly-snippets",
        "golang/vscode-go",
        "sdras/vue-vscode-snippets",
    },

    config = function ()
        require('luasnip.loaders.from_vscode').lazy_load()
    end,
}
