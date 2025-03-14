return {
    'lewis6991/gitsigns.nvim',
    config = function ()
         require('lua.plugins.gitsigns').setup()
    end,
    cmd = { "Gitsigns" },
}
