return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            dim_inactive = false, -- dims inactive windows
            terminal_colors = true,
            on_colors = function(colors)
                -- to change these look at tokyonight_storm.lua
                -- can even take a screenshot and rg/grep the colour
                colors.bg = "#000000" -- background colour
                colors.green = "#e2eb56" -- string colour
                colors.green1 = "#4fd633" -- variables
                colors.blue = "#2d5dd6" -- function members
                colors.blue0 = "#14a3e8" -- functions
                colors.magenta = "#9d33ff" -- keywords
                colors.fg_gutter = "#535561" -- line numbers
                colors.bg_highlight = "#30333e" -- highlight line colour
                colors.bg_statusline = "#000000" -- status line background
                colors.bg_popup = "#000000" -- popup when inputting commands
                colors.bg_sidebar = "#1f2335" -- popup with whichkey
                colors.bg_visual = "#2e3c64" -- visual highlights
                -- setting these to to be different removes the padded ^^^^^^^
                colors.fg_dark = "#535561" -- command text
                colors.fg_sidebar = "#FFFFFF" -- statusline text
            end
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}
