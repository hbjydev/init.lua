local M = {
    diagnostic_icons = {
        error = '',
        warn = '',
        hint = '',
        info = '',
    }
}

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
    _G['hvim/modules'] = {}
    _G['hvim/pack'] = {}
    M.ensurelazy()
end

function M.setup()
    for _, entry in pairs(_G['hvim/modules']) do
        for _, path in pairs(entry.import_paths) do
            require(path)
        end
    end

    require("lazy").setup(_G["hvim/pack"])
end

function M.modules(cat, names)
    if not type(cat) == "string" then error("cat must be a string") end
    if not type(names) == "table" then error("names must be a list") end

    local prefix = "modules." .. cat

    for _, name in pairs(names) do
        local entry = {
            cat = cat,
            import_paths = {
                prefix .. "." .. name
            },
        }

        _G['hvim/modules'][name] = entry
    end
end

function M.ifmodule(name, cb)
    assert(type(name) == "string", "name must be a string")
    local mod = _G['hvim/modules'][name]

    if not (mod == nil) then
        return cb()
    end
end

function M.pack(spec)
    table.insert(_G['hvim/pack'], spec)
end

return M
