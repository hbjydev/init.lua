local hvim = require("core.macros")

hvim.pack({
    "nvimdev/lspsaga.nvim",

    event = "LspAttach",

    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },

    keys = {
        { "<leader>do", "<cmd>Lspsaga outline<cr>", desc = "Document Outline" },
    },

    opts = {
        outline = {
            win_position = 'left',
        }
    }
})
