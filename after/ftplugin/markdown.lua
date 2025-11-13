vim.wo[vim.api.nvim_get_current_win()][0].wrap = true -- Enable wrap for current .md buffer
vim.diagnostic.enable(false, { bufnr = 0 }) -- Disable diagnostics for current .md buffer

vim.opt.isfname:remove('[') -- To allow path completion on Windows :h i_CTRL-X_CTRL-F
vim.opt.isfname:remove(']')

vim.keymap.set('n', 'gf', ':Mdn open_wikilink<CR>', { buffer = true, desc = "Open markdown file from Wikilink" })
vim.keymap.set({"v", "n"}, "<C-K>", ":Mdn hyperlink_toggle<CR>", { buffer = true, desc = "Toggle hyperlink" })
vim.keymap.set("n", "<Left>", ":Mdn go_back<CR>", { buffer = true, desc = "Go to back to previously visited Markdown buffer" })
vim.keymap.set("n", "<Right>", ":Mdn go_forward<CR>", { buffer = true, desc = "Go to next visited Markdown buffer" })
vim.keymap.set({"v", "n"}, "<C-B>", ":Mdn bold_toggle<CR>", { buffer = true, desc = "Toggle bold formatting" })
vim.keymap.set({"v", "n"}, "<C-I>", ":Mdn italic_toggle<CR>", { buffer = true, desc = "Toggle italic formatting" })
