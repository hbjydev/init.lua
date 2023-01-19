local hvim = require('core.macros')

hvim.pack {
    "rcarriga/nvim-dap",

    event = "BufRead *",

    dependencies = {
        {'jay-babu/mason-nvim-dap.nvim'},
        {"rcarriga/nvim-dap-ui"},
    },

    config = function ()
        local mnd = require('mason-nvim-dap')
        local dap = require('dap')

        vim.keymap.set('n', '<F5>', ':lua require("dapui").toggle()')
        vim.keymap.set('n', '<leader>dc', dap.continue)
        vim.keymap.set('n', '<leader>dsv', dap.step_over)
        vim.keymap.set('n', '<leader>dsi', dap.step_into)
        vim.keymap.set('n', '<leader>dso', dap.step_out)
        vim.keymap.set('n', '<leader>dtb', dap.toggle_breakpoint)

        mnd.setup {
            ensure_installed = {
                'bash',
                'chrome',
                'codeclr',
                'node2',
                'php',
                'python',
                'delve',
            },
            automatic_setup = true,
        }

        require 'mason-nvim-dap'.setup_handlers()

        require('dapui').setup {
            icons = {
                expanded = "",
                collapsed = "",
                current_frame = ""
            },
            controls = {
                icons = {
                    pause = "",
                    play = "契",
                    step_into = "",
                    step_over = "",
                    step_out = "",
                    step_back = "",
                    run_last = "",
                    terminate = "",
                },
            },
            floating = { border = "single" },
        }
    end
}
