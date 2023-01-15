local lsp = require('lsp-zero')
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

-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- disable confirm with Enter key
cmp_mappings['<CR>'] = nil

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

        format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = string.format('%s', cmp_kinds[vim_item.kind])
            return vim_item
        end,
    },
}
