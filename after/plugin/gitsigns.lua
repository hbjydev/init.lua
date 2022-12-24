require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsAdd'   , text = '▍', numhl='GitSignsAddNr'   , linehl='DiffAdded'   },
        change       = { hl = 'GitSignsChange', text = '▍', numhl='GitSignsChangeNr', linehl='DiffChanged' },
        delete       = { hl = 'GitSignsDelete', text = '▸', numhl='GitSignsDeleteNr', linehl='DiffRemoved' },
        topdelete    = { hl = 'GitSignsDelete', text = '▾', numhl='GitSignsDeleteNr', linehl='DiffRemoved' },
        changedelete = { hl = 'GitSignsChange', text = '▍', numhl='GitSignsChangeNr', linehl='DiffChanged' },
        untracked    = { hl = 'GitSignsAdd'   , text = '▍', numhl='GitSignsAddNr'   , linehl='DiffAdded'   },
    },
}
