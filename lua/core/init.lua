local hvim = require("core.macros")

require("core.remap")
require("core.set")

hvim.init()

hvim.pack("nyoom-engineering/oxocarbon.nvim")
hvim.pack({ "nvim-lua/plenary.nvim", lazy = true })

--hvim.pack {
--    "giusgad/pets.nvim",
--    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
--    lazy = false,
--    config = true,
--}

hvim.modules("editor", {
    "comment",
    "fold",
    "indentline",
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
    "neogit",
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
    "luasnip",
})

hvim.setup()
