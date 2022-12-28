local lsp = require('lsp-zero')
local builtin = require('telescope.builtin')

lsp.preset('recommended')

lsp.ensure_installed {
	"cssls",
	"cssmodules_ls",
	"bashls",
	"dockerls",
	"tsserver",
	"eslint",
	"sumneko_lua",
	"gopls",
	"golangci_lint_ls",
	"intelephense",
	"pyright",
	"tailwindcss",
	"terraformls",
	"rnix",
	"volar",
	"yamlls",
	"jsonls",
	"ansiblels",
	"bufls",
	"cmake",
	"prismals",
	"html",
}

local cmp = require('cmp')

local cmp_kinds = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = "  ",
    Variable = "  ",
    Class = "  ",
    Interface = "  ",
    Module = "  ",
    Property = "  ",
    Unit = "  ",
    Value = "  ",
    Enum = "  ",
    Keyword = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    EnumMember = "  ",
    Constant = "  ",
    Struct = "  ",
    Event = "  ",
    Operator = "  ",
    Copilot = "  ",
    TypeParameter = "  ",
}

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings {
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
}

lsp.set_preferences {
	sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = '',
    },
}

lsp.setup_nvim_cmp {
	mapping = cmp_mappings,
    experimental = {
        ghost_text = true,
    },

    window = {
        documentation = { border = "solid" },
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },

    view = {
        entries = { name = "custom", selection_order = "near_cursor" },
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },

        format = function(entry, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = string.format('%s', cmp_kinds[vim_item.kind])
            return vim_item
        end,
    },
}

lsp.on_attach(function (client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, opts)

    vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)
end)

lsp.nvim_workspace()
lsp.setup()

require("fidget").setup({})
