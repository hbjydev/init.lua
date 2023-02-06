local hvim = require("core.macros")

hvim.pack({
    "nvim-neorg/neorg",

    build = ":Neorg sync-parsers",

    cmd = "Neorg",
    ft = "norg",

    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.norg.concealer"] = {},

            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },

            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        personal = "~/Notes/personal",
                        work = "~/Notes/work",
                    },
                },
            },
        },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
})
