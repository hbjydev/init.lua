local macros = require('core.macros')

macros.pack {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            numbers = "none",
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function (_, _, dict)
                local s = ""
                for kind, count in pairs(dict) do
                    s = string.format("%s %s %d", s, macros.diagnostic_icons[kind], count)
                end
                return s
            end,
            show_buffer_close_icons = false,
            show_close_icon = false,
            persist_buffer_sort = true,
            separator_style = { "│", "│" },
            indicator = { icon = "│", style = "icon" },
            enforce_regular_tabs = false,
            always_show_bufferline = false,
            offsets = {
                { filetype = "NvimTree", text = "Files", text_align = "center" },
                { filetype = "DiffviewFiles", text = "Source Control", text_align = "center" },
            },
        }
    },

    config = function (_, config)
        require('bufferline').setup(config)

        vim.api.nvim_set_keymap('n', '<C-PageUp>', ':bn<CR>', { silent = true })
        vim.api.nvim_set_keymap('n', '<C-PageDown>', ':bp<CR>', { silent = true })
    end
}
