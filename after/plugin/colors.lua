require("catppuccin").setup {
	flavour = "macchiato"
}

function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
