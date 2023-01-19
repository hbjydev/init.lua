local hvim = require('core.macros')

hvim.pack {
    "esensar/nvim-dev-container",
    cmd = {
        "DevcontainerBuild",
        "DevcontainerImageRun",
        "DevcontainerBuildAndRun",
        "DevcontainerBuildRunAndAttach",
        "DevcontainerComposeUp",
        "DevcontainerComposeDown",
        "DevcontainerComposeRm",
        "DevcontainerStartAuto",
        "DevcontainerStartAutoAndAttach",
        "DevcontainerAttachAuto",
        "DevcontainerStopAuto",
        "DevcontainerStopAll",
        "DevcontainerRemoveAll",
        "DevcontainerLogs",
        "DevcontainerOpenNearestConfig",
        "DevcontainerEditNearestConfig",
    },
    opts = {},
}
