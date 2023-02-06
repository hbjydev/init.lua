local hvim = require('core.macros')

hvim.pack {
    "folke/todo-comments.nvim",

    cmd = "TodoTelescope",

    event = "BufEnter *",

    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {},
}
