return {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufRead',
    config = function ()
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, {desc = 'Open all folds'})
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, {desc = 'Close all folds'})
        vim.keymap.set('n', 'P',
        function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end, {desc = "Peek folded lines under cursor"})

        -- LSP Folding
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        local language_servers = vim.lsp.get_clients()
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
            })
        end

        require('ufo').setup()

    end
}
