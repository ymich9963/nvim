return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
        completions = { lsp = { enabled = true } },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    event = "BufRead *.md",
    -- download pylatexenc for latex in Markdown
}

