local hvim = require('core.macros')

hvim.pack {
    "rcarriga/nvim-dap",
    lazy = true,

    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            lazy = true,
            opts = {
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
            },
        },
    },
}
