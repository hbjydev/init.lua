local hvim = require("core.macros")

hvim.pack({
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",

    keys = {
        { "<leader>pv", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree" },
    },

    opts = {
        view = {
            side = "right",
            width = 25,
            hide_root_folder = true,
            adaptive_size = true,
        },

        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        update_cwd = true,
        git = { enable = false, ignore = true },
        hijack_directories = { enable = false, auto_open = true },
        actions = { open_file = { resize_window = true } },
        renderer = { indent_markers = { enable = false } },
    },
})
