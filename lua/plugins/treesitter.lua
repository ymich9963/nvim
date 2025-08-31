return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require'nvim-treesitter.configs'.setup({
            ensure_installed = {"c", "cpp", "python", "json", "markdown", "markdown_inline", "javascript", "lua", "vim", "vimdoc", "doxygen", "html"}, -- 'latex' requires the tree-sitter CLI to be installed
            sync_install = false,
            auto_install = true,
            highlight = { enable = true, },
        })
    end,
}
