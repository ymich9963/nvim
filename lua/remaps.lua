vim.keymap.set("n", "<C-i>", "gg=G``") -- Auto-indent and go back to position
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>") -- Escape the terminal and go back to normal mode
vim.keymap.set("n", "<leader>re", ":%s/<C-R><C-W>/") -- Shortcut to replace current word under cursor
