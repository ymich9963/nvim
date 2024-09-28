return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- Does not work on Windows I think, do manually
    -- build = "cd $HOME\\AppData\\Local\\nvim-data\\lazy\\markdown-preview.nvim\\app && npm install",
    -- execute, `cd $HOME\AppData\Local\nvim-data\lazy\markdown-preview.nvim\app\` and `npm install`
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}
