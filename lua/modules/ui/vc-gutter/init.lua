local hvim = require("core.macros")

hvim.pack({
    "lewis6991/gitsigns.nvim",
    cmd = "Gitsigns",
    event = "BufRead",

    keys = {
        { "]c", ":Gitsigns next_hunk<CR>", desc = "Next Hunk" },
        { "[c", ":Gitsigns prev_hunk<CR>", desc = "Previous Hunk" },

        { "<leader>hs", ":Gitsigns stage_hunk<CR>" },
        { "<leader>hS", ":Gitsigns stage_buffer<CR>" },

        { "<leader>hu", ":Gitsigns undo_stage_hunk<CR>" },

        { "<leader>hr", ":Gitsigns reset_hunk<CR>" },
        { "<leader>hR", ":Gitsigns reset_buffer<CR>" },

        { "<leader>hp", ":Gitsigns preview_hunk<CR>" },
    },

    opts = {
        signs = {
            add = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "DiffAdded" },
            change = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "DiffChanged" },
            delete = { hl = "GitSignsDelete", text = "▸", numhl = "GitSignsDeleteNr", linehl = "DiffRemoved" },
            topdelete = { hl = "GitSignsDelete", text = "▾", numhl = "GitSignsDeleteNr", linehl = "DiffRemoved" },
            changedelete = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "DiffChanged" },
            untracked = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "DiffAdded" },
        },

        numhl = true,

        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
        },
    },
})
