return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    -- ft = "md",
    event = "BufRead *.md",
    -- automatically lazy loads on ft.
}

