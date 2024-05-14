return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{}
        vim.keymap.set("n", "<leader>=", ":BufferLineCycleNext<CR>")
        vim.keymap.set("n", "<leader>-", ":BufferLineCyclePrev<CR>")
        vim.keymap.set("n", "<leader>9", ":BufferLineCloseOthers<CR>")
    end
}
