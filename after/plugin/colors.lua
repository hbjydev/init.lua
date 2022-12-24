local lualine = require('lualine')

function ColorMyPencils(color)
	color = color or "oxocarbon"
    lualine_settings = {}

    if color == "oxocarbon" then
        vim.opt.background = "dark"
    elseif color == "catppuccin" then
        vim.opt.background = "dark"
        lualine_settings {
            options = {
                theme = 'catppuccin'
            }
        }
        require("catppuccin").setup {
            flavour = "macchiato"
        }
        lualine.setup(lualine_settings)
    end

	vim.cmd.colorscheme(color)
end

ColorMyPencils()
