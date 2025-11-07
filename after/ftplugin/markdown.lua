vim.wo.wrap = true -- Enable wrap for current .md window
vim.diagnostic.enable(false, { bufnr = 0 }) -- Disable diagnostics for current .md buffer

vim.keymap.set('n', 'gf', ':Mdn open_wikilink<CR>', { desc = "Open markdown file from Wikilink" })
vim.keymap.set({"v", "n"}, "<C-K>", ":Mdn hyperlink_toggle<CR>", { desc = "Toggle hyperlink" })
vim.keymap.set("n", "<Left>", ":Mdn go_back<CR>", { desc = "Go to back to previously visited Markdown buffer" })
vim.keymap.set("n", "<Right>", ":Mdn go_forward<CR>", { desc = "Go to next visited Markdown buffer" })
vim.keymap.set({"v", "n"}, "<C-B>", ":Mdn bold_toggle<CR>", { desc = "Toggle bold formatting" })
vim.keymap.set({"v", "n"}, "<C-I>", ":Mdn italic_toggle<CR>", { desc = "Toggle italic formatting" })
vim.opt.isfname:remove('[') -- To enable path completion on Windows :h i_CTRL-X_CTRL-F
vim.opt.isfname:remove(']')
