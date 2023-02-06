local hvim = require("core.macros")

hvim.pack({
    "rktjmp/paperplanes.nvim",
    cmd = "PP",
    opts = {
        provider = "paste.rs",
    },
})
