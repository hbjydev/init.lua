local hvim = require 'core.macros'
hvim.pack {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function ()
        require('telescope').setup {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                sorting_strategy = "ascending",

                layout_strategy = "flex",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    vertical = { mirror = false },
                    width = 0.87,
                    height = 0.8,
                    preview_cutoff = 120,
                },

                dynamic_preview_title = true,

                set_env = {
                    COLORTERM = "truecolor",
                },
            },

            extensions = {
                ["ui-select"] = {
                    require('telescope.themes').get_dropdown {},
                },
            },
        }

        require('telescope').load_extension('ui-select')

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, {})
    end
}
