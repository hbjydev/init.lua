local hvim = require("core.macros")

require("core.remap")
require("core.set")

hvim.init()

hvim.pack("nyoom-engineering/oxocarbon.nvim")
hvim.pack({ "nvim-lua/plenary.nvim", lazy = true })

hvim.modules("editor", {
    "comment",
    "fold", -- TODO: Something wrong with mappings I think
    "todos",
})

hvim.modules("lang", {
    "golang",
    "lua",
    "typescript",
})

hvim.modules("tools", {
    "debugger",
    "docker",
    "editorconfig",
    "lsp",
    "mason",
    "neorg",
    "null-ls",
    "pastebin",
    "telescope",
    "tree-sitter",
})

hvim.modules("ui", {
    "dashboard",
    "hvim",
    "neotree",
    "noice",
    "tabs",
    "vc-gutter",
    "window-select",
})

hvim.modules("completion", {
    "cmp",
    "vsnip",
})

hvim.setup()
