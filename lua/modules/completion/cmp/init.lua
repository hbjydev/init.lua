local hvim = require('core.macros')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

hvim.pack {
    "hrsh7th/nvim-cmp",

    event = { "InsertEnter" },
    cmd = "CmpStatus",

    dependencies = {
        {'onsails/lspkind.nvim', lazy = true},
        {'hrsh7th/cmp-path', lazy = true},
        {'hrsh7th/cmp-buffer', lazy = true},
        {'hrsh7th/cmp-cmdline', lazy = true},
        {'hrsh7th/cmp-nvim-lsp', lazy = true},
        {'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true},

        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'rafamadriz/friendly-snippets',
            },
        },
        {'saadparwaiz1/cmp_luasnip', lazy = true},
    },

    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        local lspkind = require('lspkind')
        lspkind.init()

        local cmp_sources = {
            { name = "luasnip", group_index = 1 },
            { name = "buffer", group_index = 2 },
            { name = "path", group_index = 2 },
            { name = "path", group_index = 2 },
        }

        -- hvim.ifmodule('lsp', function ()
        --     table.insert(cmp_sources, { name = "nvim_lsp", group_index = 1 })
        --     table.insert(cmp_sources, { name = "nvim_lsp_signature_help", group_index = 1 })
        -- end)

        local icons = {
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

        cmp.setup({
            experimental = { ghost_text = true },

            window = {
                documentation = { border = "solid" },
                completion = {
                    col_offset = -3,
                    side_padding = 0,
                    winhighlight = "Normal:NormalFloat,NormalFloat:Pmenu,Pmenu:NormalFloat",
                },
            },

            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },

            enabled = function ()
                local context = require('cmp.config.context')
                hvim.ifmodule('tree-sitter', function ()
                    if vim.api.nvim_get_mode().mode == "c" then
                        return true
                    end
                    return (not context.in_treesitter_capture('comment')) and
                           (not context.in_syntax_group('Comment'))
                end)
            end,

            preselect = cmp.PreselectMode.None,

            snippet = {
                expand = function (args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-y>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false
                }),

                ["<Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            sources = cmp.config.sources(cmp_sources),

            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function (_, vim_item)
                    vim_item.menu = vim_item.kind
                    vim_item.kind = icons[vim_item.kind]
                    return vim_item
                end,
            },
        })

        vim.o.completeopt = 'menu,menuone,noselect'

        require('luasnip.loaders.from_vscode').lazy_load()
    end,
}
