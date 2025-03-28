return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        -- local highlight = {
        --     "CursorColumn",
        --     "Whitespace",
        -- }
        -- require("ibl").setup {
        --     indent = { highlight = highlight, char = "" },
        --     whitespace = {
        --         highlight = highlight,
        --         remove_blankline_trail = false,
        --     },
        --     scope = { enabled = false },
        -- }
        require("ibl").setup({
            scope = {enabled = false}
        })
    end,
    event = "BufReadPost",
}
