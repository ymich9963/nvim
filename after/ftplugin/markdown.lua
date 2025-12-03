vim.wo[vim.api.nvim_get_current_win()][0].wrap = true -- Enable wrap for current .md buffer
vim.diagnostic.enable(false, { bufnr = 0 }) -- Disable diagnostics for current .md buffer

vim.keymap.set("i", "<C-x><C-f>", "<cmd>set isfname-=[,]<CR><C-x><C-f><cmd>set isfname+=[,]<CR>",
{
    desc = "Mdnotes smart remap to allow path completion on Windows (:h i_CTRL-X_CTRL-F)",
    buffer = true
})
