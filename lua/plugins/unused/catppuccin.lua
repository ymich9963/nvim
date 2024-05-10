return{
    "catpuccin/nvim",
    name = "catpuccin",
    priority = 1000,
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    },
    config = function()
        vim.cmd([[colorscheme catpuccin]])
    end,
}
