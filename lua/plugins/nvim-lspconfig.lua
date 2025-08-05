return {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    config = function ()
        local home_dir = vim.env.HOME

        vim.lsp.config("clangd", {
            cmd = {home_dir .. "\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--header-insertion=never"}
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })

        -- LSP diagnostics config
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        -- Builtin
        -- vim.opt.completeopt = { "fuzzy", "menuone", "noselect", "popup" }
        -- vim.api.nvim_create_autocmd('LspAttach', {
        --     callback = function(ev)
        --         local client = vim.lsp.get_client_by_id(ev.data.client_id)
        --         if client:supports_method('textDocument/completion') then
        --             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        --         end
        --     end,
        -- })

    end,

    keys = {
        {"gd", function() vim.lsp.buf.definition() end, "n", desc = "Go to definition"},
        {"K", function() vim.lsp.buf.hover(nil, {focus=false}) end, "n", desc = "Display info in float window"},
        {"<leader>fd", function() vim.diagnostic.open_float(nil, {focus=false}) end, desc = "Open diagnostics in float window"},
    }
}

