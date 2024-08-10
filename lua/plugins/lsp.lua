return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        -- "j-hui/fidget.nvim",
    },
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local cmp = require('cmp')
        local select_opts = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1
                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?`
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':'
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })


        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers {
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = { globals = {'vim'} } -- to remove the unkown global 'vim' warning
                        }
                    }
                }
            end,
            -- used to start an LSP (clangd in this case) with specific settings
            -- clangd = function()
                --     local lspconfig = require('lspconfig')
                --     lspconfig.clangd.setup({
                    --         name = "clangd",
                    --         cmd = {"C:\\Users\\yiannis\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--log=verbose"}
                    --     })
                    -- end,
                }


            end,

        }
