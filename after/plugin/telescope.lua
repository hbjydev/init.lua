local builtin = require('telescope.builtin')

require('telescope').setup {
    extensions = {
        ["ui-select"] = {
            require('telescope.themes').get_dropdown {}
        },
    }
}
require('telescope').load_extension('ui-select')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
