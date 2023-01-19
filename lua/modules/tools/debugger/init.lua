local hvim = require('core.macros')

hvim.pack {
    "rcarriga/nvim-dap",

    lazy = true,

    dependencies = {
        {'jay-babu/mason-nvim-dap.nvim'},

        {"rcarriga/nvim-dap-ui"},
    },

    config = function ()
        local mnd = require('mason-nvim-dap')
        mnd.setup {
            ensure_installed = {
                'bash-debug-adapter',
                'chrome-debug-adapter',
                'debugpy',
                'go-debug-adapter',
                'js-debug-adapter',
                'netcoredbg',
                'php-debug-adapter',
            },

            automatic_setup = true,
        }

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
