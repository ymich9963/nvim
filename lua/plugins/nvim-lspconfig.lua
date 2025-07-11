return {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    config = function ()
        local home_dir = vim.env.HOME

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = {
                            "vim",
                            "require",
                        },
                    },
                },
            },
        })

        vim.lsp.config("clangd", {
            cmd = {home_dir .. "\\AppData\\Local\\nvim-data\\mason\\bin\\clangd.CMD", "--header-insertion=never"}
        })

        -- LSP diagnostics config
        vim.diagnostic.config({
            -- virtual_text = { current_line = false},
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        -- Built-in auto-complete. Has the re-maps for a nicer functioning pmenu.
        -- vim.cmd[[set completeopt+=menuone,noselect,popup]]
        -- vim.api.nvim_create_autocmd("LspAttach", {
        --     group = vim.api.nvim_create_augroup("my.lsp", {}),
        --     callback = function(args)
        --         local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        --         if client:supports_method("textDocument/completion") then
        --             local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
        --             client.server_capabilities.completionProvider.triggerCharacters = chars
        --             vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        --         end
        --     end,
        -- })
        --
        -- local npairs = require('nvim-autopairs') -- Taken from the coq_nvim section in the autopairs repo to prevent a new line when auto completing
        -- _G.MUtils= {}
        --
        -- MUtils.CR = function()
        --     if vim.fn.pumvisible() ~= 0 then
        --         if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        --             return npairs.esc('<c-y>')
        --         else
        --             return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        --         end
        --     else
        --         return npairs.autopairs_cr()
        --     end
        -- end
        -- vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
        --
        -- MUtils.BS = function()
        --     if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        --         return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        --     else
        --         return npairs.autopairs_bs()
        --     end
        -- end
        -- vim.api.nvim_set_keymap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
        --
        -- vim.api.nvim_set_keymap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
        -- vim.api.nvim_set_keymap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
        -- End of built-in auto-complete

    end,


    keys = {
        {"gd", function() vim.lsp.buf.definition() end, "n", desc = "Go to definition"},
        {"K", function() vim.lsp.buf.hover(nil, {focus=false}) end, "n", desc = "Display info in float window"},
        {"<leader>fd", function() vim.diagnostic.open_float(nil, {focus=false}) end, desc = "Open diagnostics in float window"},
    }
}

