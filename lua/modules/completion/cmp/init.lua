local hvim = require("core.macros")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

hvim.pack({
    "hrsh7th/nvim-cmp",
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
    cmd = "CmpStatus",
    dependencies = {
        { "hrsh7th/cmp-path", lazy = true },
        { "hrsh7th/cmp-buffer", lazy = true },
        { "hrsh7th/cmp-cmdline", lazy = true },
        { "hrsh7th/cmp-vsnip", lazy = true },
        { "saadparwaiz1/cmp_luasnip", lazy = true },
        { "hrsh7th/cmp-nvim-lsp", lazy = true },
        { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },

        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require("cmp")

        local cmp_sources = {
            { name = "neorg", group_index = 1 },
            { name = "nvim_lsp", group_index = 1 },
            { name = "nvim_lsp_signature_help", group_index = 1 },
            { name = "buffer", group_index = 3 },
            { name = "path", group_index = 3 },
        }

        local snippet_expander = function(_)
            print("TODO!")
        end

        local can_expand = function()
            print("TODO!")
        end

        local expand = function()
            print("TODO!")
        end

        local can_jump_back = function()
            print("TODO!")
        end

        local jump_back = function()
            print("TODO!")
        end

        hvim.ifmodule("vsnip", function()
            table.insert(cmp_sources, { name = "vsnip", group_index = 2 })
            snippet_expander = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
            can_expand = function()
                return vim.fn["vsnip#available"](1) == 1
            end
            expand = function()
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            end
            can_jump_back = function()
                return vim.fn["vsnip#jumpable"](-1) == 1
            end
            jump_back = function()
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end)

        hvim.ifmodule("luasnip", function()
            table.insert(cmp_sources, { name = "luasnip", group_index = 2 })
            snippet_expander = function(args)
                require("luasnip").lsp_expand(args.body)
            end
            can_expand = function()
                return require("luasnip").expand_or_jumpable()
            end
            expand = function()
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            end
            can_jump_back = function()
                return require("luasnip").jumpable(-1)
            end
            jump_back = function()
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            end
        end)

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
            TypeParameter = "  ",
        }

        cmp.setup({
            experimental = { ghost_text = true },
            window = {
                documentation = { border = "solid" },
                completion = {
                    col_offset = -3,
                    side_padding = 0,
                },
            },
            preselect = cmp.PreselectMode.None,
            snippet = {
                expand = snippet_expander,
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),

                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<C-e>"] = cmp.mapping.close(),

                ["<C-y>"] = cmp.mapping.confirm(),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif can_expand() then
                        expand()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif can_jump_back() then
                        jump_back()
                    end
                end, { "i", "s" }),
            },
            sources = cmp_sources,
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(_, vim_item)
                    vim_item.menu = vim_item.kind
                    vim_item.kind = icons[vim_item.kind]
                    return vim_item
                end,
            },
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })

        vim.o.completeopt = "menu,menuone,noselect"
    end,
})
