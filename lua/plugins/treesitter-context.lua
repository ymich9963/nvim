return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    event = 'BufEnter',
    opts =  {
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    }
}
