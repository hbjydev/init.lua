local hvim = require("core.macros")
local vvar = vim.api.nvim_get_vvar

hvim.pack({
    "numToStr/Comment.nvim",

    opts = {
        mappings = {
            basic = false,
            extra = false,
        },
    },

    keys = {
        -- opleader
        { "gc", "<Plug>(comment_toggle_linewise)" },
        { "gb", "<Plug>(comment_toggle_blockwise)" },

        -- toggle
        {
            "gcc",
            function()
                return vvar("count") == 0 and "<Plug>(comment_toggle_linewise_current)"
                    or "<Plug>(comment_toggle_linewise_count)"
            end,
            expr = true,
            desc = "Comment toggle current line",
        },
        {
            "gbc",
            function()
                return vvar("count") == 0 and "<Plug>(comment_toggle_blockwise_current)"
                    or "<Plug>(comment_toggle_blockwise_count)"
            end,
            expr = true,
            desc = "Comment toggle current block",
        },

        -- visual mode
        {
            "gc",
            "<Plug>(comment_toggle_linewise_visual)",
            mode = "x",
            desc = "Comment toggle linewise (visual)",
        },
        {
            "gb",
            "<Plug>(comment_toggle_blockwise_visual)",
            mode = "x",
            desc = "Comment toggle blockwise (visual)",
        },

        -- extra mappings
        {
            "gcO",
            function()
                require("Comment.api").insert.linewise.above()
            end,
            desc = "Comment insert above",
        },
        {
            "gco",
            function()
                require("Comment.api").insert.linewise.below()
            end,
            desc = "Comment insert below",
        },
        {
            "gcA",
            function()
                require("Comment.api").locked("insert.linewise.eol")
            end,
            desc = "Comment insert end of line",
        },
    },
})
