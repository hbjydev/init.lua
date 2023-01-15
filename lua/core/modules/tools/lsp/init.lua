local hvim = require('core.macros')

hvim.pack {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',

        -- Snippet Collection (Optional)
        'rafamadriz/friendly-snippets',

        'j-hui/fidget.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'jay-babu/mason-null-ls.nvim',
    },

    event = "BufRead",

    config = function ()
        local lsp = require('lsp-zero')
        local util = require('lspconfig.util')
        local cmp = require('cmp')
        local null_ls = require('null-ls')
        local mason_null_ls = require('mason-null-ls')

        lsp.preset('recommended')
        lsp.ensure_installed {
            "cssls",
            "cssmodules_ls",
            "bashls",
            "dockerls",
            "denols",
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
            "ltex",
        }

        lsp.configure('denols', {
            root_dir = util.root_pattern('deno.json', 'deno.jsonc'),
        })

        lsp.configure('fennel-ls', {})
        lsp.setup_servers({'fennel-ls', force = true})

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

                format = function(_, vim_item)
                    vim_item.menu = vim_item.kind
                    vim_item.kind = string.format('%s', cmp_kinds[vim_item.kind])
                    return vim_item
                end,
            },
        }

        lsp.on_attach(function (_, bufnr)
            local builtin = require('telescope.builtin')
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, opts)

            vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)
        end)

        lsp.nvim_workspace {
            library = vim.api.nvim_get_runtime_file('', true)
        }

        lsp.setup()

        require("fidget").setup {}

        mason_null_ls.setup {
            ensure_installed = {
                'commitlint',
                'flake8',
                'gofumpt',
                'golangci-lint',
                'golines',
                'gomodifytags',
                'gotests',
                'phpcs',
                'phpstan',
                'shellcheck',
                'tflint',
                'yamllint',
            },
            automatic_setup = true,
        }

        mason_null_ls.setup_handlers {}

        null_ls.setup()
    end
}
