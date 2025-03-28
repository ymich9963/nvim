vim.keymap.set("n", "<C-i>", "gg=G``") -- Auto-indent and go back to position
vim.keymap.set("n", "<leader>re", ":%s/<C-R><C-W>/") -- Shortcut to replace current word under cursor
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>") -- Escape the terminal and go back to normal mode
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>") -- Ctr-w in terminal mode

-- The ones below here are from ThePrimeagen/init.lua repo
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste without replacing what was copied"})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy to system clipboard"})
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Replace in file, case sensitive"})

-- Move a selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line and cursor remains in the same place
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumps with cursor centered on screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- I hate <C-w>q
vim.keymap.set("n", "<C-w>q", "<nop>", {desc = "Default use is to close a window, disabled it"})

-- Quickfix list stuff
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

