return {
    "neovim/nvim-lspconfig",
    event = 'VimEnter',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local home_dir = vim.env.HOME
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
            clangd = function()
                local lspconfig = require('lspconfig')
                lspconfig.clangd.setup({
                    name = "clangd",
                    -- cmd = {home_dir "\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--log=verbose"}
                    cmd = {home_dir .. "\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--header-insertion=never"}
                })
            end,
        }

        -- LSP diagnostics config
        vim.diagnostic.config({
            -- virtual_text = { current_line = false},
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })
    end,

    keys = {
        {"gd", function() vim.lsp.buf.definition() end, "n", desc = "Go to definition"},
        {"K", function() vim.lsp.buf.hover(nil, {focus=false}) end, "n", desc = "Display info in float window"},
        {"<leader>fd", function() vim.diagnostic.open_float(nil, {focus=false}) end, desc = "Open diagnostics in float window"},
    }
}
