return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            on_colors = function(colors)
                colors.bg = "#000000"
            end
        })
        require("tokyonight")
        vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {},
}
