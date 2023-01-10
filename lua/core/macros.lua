local M = {}

function M.ensurelazy()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)
end

function M.init()
    _G['hvim/pack'] = {}
    M.ensurelazy()
end

function M.setup()
    require("lazy").setup(_G["hvim/pack"])
end

function M.modules(cat, names)
    if not type(cat) == "string" then error("cat must be a string") end
    if not type(names) == "table" then error("names must be a list") end

    local prefix = "core.modules." .. cat

    for _, name in pairs(names) do
        local n = prefix .. "." .. name
        require(n)
    end
end

function M.pack(spec)
    table.insert(_G['hvim/pack'], spec)
end

return M
