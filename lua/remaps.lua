vim.keymap.set("n", "<C-i>", "gg=G``") -- Auto-indent and go back to position
vim.keymap.set("n", "<leader>re", ":%s/<C-R><C-W>/") -- Shortcut to replace current word under cursor
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>") -- Escape the terminal and go back to normal mode
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>") -- Ctr-w in terminal mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h") -- Move to the left buffer while in terminal mode
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j") -- Move to the bottom buffer while in terminal mode
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k") -- Move to the top buffer while in terminal mode
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l") -- Move to the right buffer while in terminal mode
