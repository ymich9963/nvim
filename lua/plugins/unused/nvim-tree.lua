return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
   config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw          = 1
        vim.g.loaded_netrwPlugin    = 1

        nvimtree.setup({
            view = {
                width = 30,
            }
        })

        vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>tff", ":NvimTreeFindFile<CR>")
        vim.keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>")
        vim.keymap.set("n", "<leader>ts", ":NvimTreeResize -10<CR>")
        vim.keymap.set("n", "<leader>tl", ":NvimTreeResize +10<CR>")
    end,
}
