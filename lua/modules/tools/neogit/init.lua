local hvim = require('core.macros')

hvim.pack {
    'timuntersberger/neogit',

    cmd = "Neogit",

    keys = {
        { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
    },

    config = true,
}
