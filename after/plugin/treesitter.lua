require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
	"c",
	"cpp",
	"lua",
	"go",
	"typescript",
	"javascript",
	"help",
	"json",
	"yaml",
	"python",
	"nix",
	"php",
	"bash",
	"css",
	"cmake",
	"dockerfile",
	"git_rebase",
	"gitcommit",
	"gomod",
	"gowork",
	"hcl",
	"html",
	"jq",
	"jsdoc",
	"latex",
	"make",
	"markdown",
	"phpdoc",
	"prisma",
	"proto",
	"rego",
	"toml",
	"tsx",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },
}
