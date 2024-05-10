return {
    "romgrk/barbar.nvim",
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
        vim.keymap.set("n", "<leader>=", ":BufferNext<CR>")
        vim.keymap.set("n", "<leader>-", ":BufferPrevious<CR>")
    end,
    -- config = function()
    --     vim.keymap.set("n", "<leader>=", ":BufferNext<CR>")
    --     vim.keymap.set("n", "<leader>-", ":BufferPrevious<CR>")
    -- end,
    opts = {},
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
