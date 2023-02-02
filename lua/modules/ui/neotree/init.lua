local hvim = require('core.macros')

-- vim.g.neo_tree_remove_legacy_commands = 1

hvim.pack {
    'nvim-neo-tree/neo-tree.nvim',

    cmd = "Neotree",

    keys = {
        { "<leader>pv", "<cmd>Neotree toggle<CR>", desc = "Neotree" },
    },

    opts = {
        window = {
            position = "right",
        },
    },

    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
}
