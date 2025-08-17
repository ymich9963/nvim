return {
    "ibhagwan/fzf-lua",
    event = "VimEnter",
    config = function()
        -- calling `setup` is optional for customization
        vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, { desc = "Fzf files" })
        vim.keymap.set("n", "<leader>fg", require('fzf-lua').grep, { desc = "Fzf grep" })
        vim.keymap.set("n", "<leader>flg", require('fzf-lua').live_grep, { desc = "Fzf live grep" })
        vim.keymap.set("n", "<leader>fo", require('fzf-lua').oldfiles, { desc = "Fzf old files" })
        vim.keymap.set("n", "<leader>rr", require('fzf-lua').resume , { desc = "Fzf resume" })
        vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function() require("fzf-lua").complete_path() end, { silent = true, desc = "Fuzzy complete path" })
    end
};
