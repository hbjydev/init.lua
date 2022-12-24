local modes = {
    ["n"]  = "RW",
    ["no"] = "RO",

    ["v"]    = "**",
    ["V"]    = "**",
    ["\022"] = "**",

    ["s"]    = "S",
    ["S"]    = "SL",
    ["\019"] = "SB",

    ["i"]  = "**",
    ["ic"] = "**",

    ["R"]  = "RA",
    ["Rv"] = "Rv",

    ["c"]  = "VIEX",
    ["cv"] = "VIEX",
    ["ce"] = "EX",

    ["r"]  = "r",
    ["rm"] = "r",
    ["r?"] = "r",

    ["!"] = "!",

    ["t"] = "",
}

function getLspDiagnostic()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    if count["errors"] ~= 0 then
        errors = " %#DiagnosticError# " .. count["errors"]
    end
    if count["warnings"] ~= 0 then
        warnings = " %#DiagnosticWarn# " .. count["warnings"]
    end
    if count["hints"] ~= 0 then
        hints = " %#DiagnosticHint# " .. count["hints"]
    end
    if count["info"] ~= 0 then
        info = " %#DiagnosticInfo# " .. count["info"]
    end

    return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function getFiletype()
    return "%#NormalNC#" .. vim.bo.filetype
end

local function getFileinfo()
    filename = vim.fn.expand("%")
    if filename == "" then
        filename = " kekw-nvim "
    else
        filename = " " .. vim.fn.expand("%:t") .. " "
    end

    return "%#Normal#" .. filename .. "%#NormalNC#"
end

local function getMode()
    local currentMode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[currentMode]):upper()
end

local function getLineNo()
    return "%#Normal# %l:%c "
end

local function updateModeColors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#Normal#"

  if current_mode == "n" then
      mode_color = "%#StatusNormal#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatusInsert#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
      mode_color = "%#StatusVisual#"
  elseif current_mode == "R" then
      mode_color = "%#StatusReplace#"
  elseif current_mode == "c" then
      mode_color = "%#StatusCommand#"
  elseif current_mode == "t" then
      mode_color = "%#StatusTerminal#"
  end

  return mode_color
end

local function getGitStatus()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat {
     added,
     changed,
     removed,
     " ",
     "%#GitSignsAdd# ",
     git_info.head,
     " %#Normal#",
  }
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    updateModeColors(),
    getMode(),

    "%#Normal# ",
    getFileinfo(),
    getLspDiagnostic(),

    "%=%#StatusLineExtra#",
    getGitStatus(),
    getFiletype(),
    getLineNo(),
  }
end

function Statusline.inactive()
  return "%#StatusLine% %F"
end

function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
