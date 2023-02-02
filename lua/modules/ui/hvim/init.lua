local hvim = require("core.macros")

hvim.pack {
    "nyoom-engineering/oxocarbon.nvim",

    config = function()
        vim.cmd.colorscheme('oxocarbon')
        require('modules.ui.hvim.statusline')
    end,
}

hvim.pack "bfontaine/Brewfile.vim"
