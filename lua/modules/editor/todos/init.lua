local hvim = require('core.macros')

hvim.pack {
    "folke/todo-comments.nvim",

    cmd = "TodoTelescope",

    keys = {
        { "<leader>pts", "<cmd>TodoTelescope<cr>", desc = "TODO Telescope" },
        { "<leader>ptl", "<cmd>TodoQuickFix<cr>", desc = "TODO Quick Fix" },
    },

    event = "BufRead",

    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {},
}
