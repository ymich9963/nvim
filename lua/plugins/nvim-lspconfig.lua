return {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    config = function ()
    end,

    keys = {
        {"<leader>fd", function() vim.diagnostic.open_float(nil, {focus=false}) end, desc = "Open diagnostics in float window"},
    }
}

