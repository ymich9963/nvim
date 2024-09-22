return {
    "NvChad/nvim-colorizer.lua",
    lazy=true,
    config=function ()
        require("colorizer").setup()
    end,
    cmd= {"ColorizerToggle"}

}
