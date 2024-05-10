return {
    "folke/which-key.nvim",
    config = function()
        vim.keymap.set("n", "<leader>wk", ":WhichKey<CR>")
    end,
}
