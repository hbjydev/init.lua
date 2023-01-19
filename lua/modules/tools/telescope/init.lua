local hvim = require 'core.macros'
hvim.pack {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-ui-select.nvim'
    },

    cmd = "Telescope",

    keys = {
        { "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>pf",      "<cmd>Telescope find_files<cr>", desc = "Files" },
        { "<C-p>",           "<cmd>Telescope git_files<cr>", desc = "Git Files" },
        {
            "<leader>ps",
            function ()
                require('telescope.builtin').grep_string({
                    search = vim.fn.input("Grep > ")
                })
            end,
            desc = "Text search"
        }
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

                file_ignore_patterns = {
                    "node_modules",
                    ".direnv",
                    "venv",
                    "vendor",
                },
            },

            extensions = {
                ["ui-select"] = {
                    require('telescope.themes').get_dropdown {},
                },
            },
        }

        require('telescope').load_extension('ui-select')
    end,
}
