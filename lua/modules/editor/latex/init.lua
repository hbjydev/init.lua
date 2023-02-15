local hvim = require('core.macros')

hvim.pack {
    'lervag/vimtex',
    ft = { 'latex', 'tex' },
    config = function ()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_method = "zathura"
    end,
}
