local hvim = require('core.macros')

hvim.pack {
    "zbirenbaum/copilot.lua",

    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
    },
}
