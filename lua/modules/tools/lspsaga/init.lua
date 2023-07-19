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

        { "<leader>fr", "<cmd>Lspsaga finder ref<cr>", desc = "Find references" },
        { "<leader>fd", "<cmd>Lspsaga finder def<cr>", desc = "Find definitions" },
        { "<leader>fi", "<cmd>Lspsaga finder imp<cr>", desc = "Find implementations" },
    },

    opts = {
        outline = {
            win_position = 'left',
        }
    }
})
