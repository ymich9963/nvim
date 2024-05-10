return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {"c", "cpp", "python", "json", "bash", "toml", "yaml", "markdown", "javascript", "lua", "vim", "vimdoc", "query" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
           },
        }
        vim.cmd([[:TSUpdate]])
    end,
    lazy = true,
}
