return {
    "neovim/nvim-lspconfig",
    -- lazy = false,
    -- priority = 900,
    event = 'VimEnter',
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
            clangd = function()
                local lspconfig = require('lspconfig')
                lspconfig.clangd.setup({
                    name = "clangd",
                    -- cmd = {"C:\\Users\\yiannis\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--log=verbose"}
                    cmd = {"C:\\Users\\yiannis\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--header-insertion=never"}
                })
            end,
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

        -- Keymaps for LSP from ThePrimeagen/init.lua
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc = "Go to definition"})
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover(nil, {focus=false}) end, {desc = "Display info in float window"})
        -- vim.keymap.set("n", "<leader>lfo", function() vim.diagnostic.open_float(nil, {focus=false}) end, {desc = "Open diagnostics in float window"})
        vim.keymap.set("n", "<leader>lfr", function() vim.lsp.buf.references() end, {desc = "Find references of word under cursor"})
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, {desc = "Rename word under cursor"})
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc = "Go to next diagnostic"})
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc = "Go to previous diagnostic"})

    end
}
