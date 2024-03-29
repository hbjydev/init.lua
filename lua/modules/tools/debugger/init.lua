local hvim = require('core.macros')

local continue = function()
    if vim.fn.filereadable('.vscode/launch.json') then
        require('dap.ext.vscode').load_launchjs()
    end
    require('dap').continue()
end

hvim.pack {
    "rcarriga/nvim-dap",

    ft = {
        "bash",
        "c",
        "cpp",
        "go",
        "javascript",
        "php",
        "python",
        "rust",
        "typescript",
    },

    dependencies = {
        {'jay-babu/mason-nvim-dap.nvim'},
        {"rcarriga/nvim-dap-ui"},
    },

    config = function ()
        local mnd = require('mason-nvim-dap')
        local dap = require('dap')
        local dapui = require('dapui')

        vim.keymap.set('n', '<leader>dc', continue)
        vim.keymap.set('n', '<F5>', continue)

        vim.keymap.set('n', '<leader>dsv', dap.step_over)
        vim.keymap.set('n', '<leader>dsi', dap.step_into)
        vim.keymap.set('n', '<leader>dso', dap.step_out)

        vim.keymap.set('n', '<leader>dtb', dap.toggle_breakpoint)
        vim.keymap.set('n', '<F4>', dap.toggle_breakpoint)

        vim.keymap.set('n', '<leader>du', dapui.toggle)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        mnd.setup {
            ensure_installed = {
                'bash',
                'chrome',
                'codeclr',
                'codelldb',
                'node2',
                'php',
                'python',
                'delve',
            },
            automatic_installation = true,
        }

        dapui.setup {
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
