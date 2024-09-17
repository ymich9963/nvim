return {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 900,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
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

        -- LSP diagnostics config
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = false,
        })

        -- Floating windows for better diagnostics
        vim.o.updatetime = 250 -- for cursor hold
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function ()
                vim.diagnostic.open_float(nil, {focus=false})
            end
        })
    end
}
