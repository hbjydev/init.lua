local hvim = require("core.macros")

hvim.pack({
    "hrsh7th/vim-vsnip",

    event = { "InsertEnter" },

    dependencies = {
        "hrsh7th/vim-vsnip-integ",

        -- snippet packs
        "rafamadriz/friendly-snippets",
        "golang/vscode-go",
        "sdras/vue-vscode-snippets",
    },

    config = function ()

    end,
})
