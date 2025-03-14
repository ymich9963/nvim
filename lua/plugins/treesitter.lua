return {
    "nvim-treesitter/nvim-treesitter",
    event = 'VimEnter',
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {"c", "cpp", "python", "json", "yaml", "markdown", "markdown_inline", "javascript", "lua", "vim", "vimdoc", "doxygen", "latex" },
            -- 'latex' requires the tree-sitter CLI to be installed

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'markdown', "markdown_inline" },
           },
        }
        -- vim.cmd([[:TSUpdate]])
    end,
    -- lazy = true,
}
