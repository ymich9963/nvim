return {
    "neovim/nvim-lspconfig",
    event = 'VimEnter',
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function ()
        local home_dir = vim.env.HOME

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {
                            'vim',
                            'require',
                        },
                    },
                },
            },
        })

        vim.lsp.config('clangd', {
            cmd = {home_dir .. "\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--header-insertion=never"}
        })

        require("mason").setup()
        require("mason-lspconfig").setup()

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
