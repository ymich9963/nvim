vim.wo[vim.api.nvim_get_current_win()][0].wrap = true -- Enable wrap for current .md buffer
vim.diagnostic.enable(false, { bufnr = 0 }) -- Disable diagnostics for current .md buffer

vim.opt.isfname:remove('[') -- To allow path completion on Windows :h i_CTRL-X_CTRL-F
vim.opt.isfname:remove(']')
