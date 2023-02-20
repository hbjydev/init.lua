local hvim = require('core.macros')

hvim.pack {
    'lewis6991/impatient.nvim',
    config = function ()
        require('impatient')
    end
}
