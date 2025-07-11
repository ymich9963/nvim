return {
    -- Setting up Mason like this automatically enables all installed LSP servers
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        } },
        "neovim/nvim-lspconfig",
    },
}
