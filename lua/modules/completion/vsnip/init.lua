local hvim = require("core.macros")

hvim.pack({
    "hrsh7th/vim-vsnip",

    event = { "InsertEnter" },

    dependencies = {
        "hrsh7th/vim-vsnip-integ",
        "rafamadriz/friendly-snippets",
    },

    config = function ()

    end,
})
