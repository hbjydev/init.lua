require("catppuccin").setup {
	flavour = "macchiato"
}

function ColorMyPencils(color)
	color = color or "oxocarbon"

    if color == "oxocarbon" then
        vim.opt.background = "dark"
    end

	vim.cmd.colorscheme(color)
end

ColorMyPencils()
