local hvim = require("core.macros")

hvim.pack({
    "s1n7ax/nvim-window-picker",

    keys = {
        {
            "<leader>ww",
            function()
                local picker = require("window-picker")
                local pw = picker.pick_window() or vim.api.nvim_get_current_win()
                vim.api.nvim_set_current_win(pw)
            end,
            mode = "n",
            desc = "Set current window",
        },
    },

    opts = {},
})
