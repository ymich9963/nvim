return {
    "tomtom/tcomment_vim",
    config = function()
        vim.keymap.set("n", "<leader>/", ":TComment<CR>")
        vim.keymap.set("n", "<leader>b", ":TCommentBlock<CR>")
        vim.keymap.set("v", "<leader>/", ":TComment<CR>")
        vim.keymap.set("v", "<leader>b", ":TCommentBlock<CR>")
    end,
}
