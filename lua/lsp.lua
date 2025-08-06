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

-- Builtin completion
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable( true, client.id, ev.buf,
            {
                autotrigger = true,
                convert = function(item)
                    local abbr = item.label
                    abbr = #abbr > 30 and abbr:sub(1, 29) .. "…" or abbr

                    local menu = item.detail or ""
                    menu = #menu > 30 and menu:sub(1, 29) .. "…" or menu

                    return { abbr = abbr, menu = menu }
                end
            }
        )
    end

    if client:supports_method("completionItem/resolve") then
        local _, cancel_prev = nil, function() end
        vim.api.nvim_create_autocmd("CompleteChanged", { buffer = ev.buf,
        callback = function(event)
            cancel_prev()

            local info = vim.fn.complete_info({ "selected" })
            local completionItem =
            vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "completion_item")
            if not completionItem then
                return
            end

            _, cancel_prev = vim.lsp.buf_request( event.buf, vim.lsp.protocol.Methods.completionItem_resolve, completionItem,
            function(err, item, ctx)
                if not item then
                    return
                end

                local docs = (item.documentation or {}).value
                local win = vim.api.nvim__complete_set(info["selected"], { info = docs })
                if win.winid and vim.api.nvim_win_is_valid(win.winid) then
                    vim.treesitter.start(win.bufnr, "markdown")
                    vim.wo[win.winid].conceallevel = 3
                end
            end
        )
    end
})
end
end
})
