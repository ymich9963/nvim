return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            dim_inactive = false, -- dims inactive windows
            on_colors = function(colors)
                colors.bg = "#000000"
                colors.green = "#e2eb56"
                colors.green1 = "#4fd633"
                colors.green2 = "#4f5533"
                colors.blue0 = "#14a3e8"
                colors.blue = "#2426df"
                colors.magenta = "#9d33ff"
            end
        })
        require("tokyonight")
        vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {},
}
