vim.keymap.set("n", "<C-i>", "gg=G``")                                                      -- Auto-indent and go back to position
vim.keymap.set("n", "<leader>re", ":%s/<C-R><C-W>/")                                        -- Shortcut to replace current word under cursor
vim.keymap.set("n", "<leader>rl", ":.s/")                                                   -- Shortcut to replace a word in line
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")                                                 -- Escape the terminal and go back to normal mode
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")                                            -- Ctr-w in terminal mode
vim.keymap.set("n", "<leader>o", ":Explore .<CR>")                                          -- Netrw
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]], {desc = "Paste from system clipboard"})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy to system clipboard"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                                -- Move a selection up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")                                                           -- Append line and cursor remains in the same place
vim.keymap.set("n", "n", "nzzzv")                                                           -- Keep cursor in the middle when searching
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })                      -- Better indenting in visual mode
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })        -- Resizing
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader>fd", function() vim.diagnostic.open_float(nil, {focus=false}) end, {desc = "Open diagnostics in float window"}) -- LSP Remaps

