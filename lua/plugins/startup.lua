return {
    "startup-nvim/startup.nvim",
    -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        vim.keymap.set("n", "<leader>H", ":Startup display<CR>", {desc = "Go to Startup page"})
        require("startup").setup({
            header = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Header",
                margin = 5,
                content = {
                    "░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓██████████████▓▒░░▒▓████████▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ",
                    "░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░  ",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ",
                    "░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░",
                },
                highlight = "Statement",
                default_color = "",
                oldfiles_amount = 0,
            },
            body1 = {
                type = "mapping",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Basic Commands",
                margin = 2,
                content = {
                    { " Find File", "FzfLua files", "<leader>ff" },
                    { "󰍉 Find Word", "FzfLua live_grep", "<leader>lg" },
                    { " Recent Files", "FzfLua oldfiles", "<leader>of" },
                    { " Colorschemes", "FzfLua colorschemes", "<leader>cs" },
                },
                highlight = "String",
                default_color = "",
                oldfiles_amount = 0,
            },
            body2 = {
                type = "oldfiles",
                oldfiles_directory = true,
                align = "center",
                fold_section = false,
                title = "",
                margin = 5,
                content = "",
                highlight = "String",
                oldfiles_amount = 5,
            },
            body3 = {
                type = "oldfiles",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "",
                margin = 5,
                content = "",
                highlight = "String",
                oldfiles_amount = 5,
            },

            options = {
                after = function()
                    require("startup.utils").oldfiles_mappings() -- to use numbers in the startup screen
                end,
                mapping_keys = false,
                cursor_column = 0.5,
                empty_lines_between_mappings = true,
                disable_statuslines = false,
                paddings = { 10, 2, 2, 2},
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            colors = {
                background = "#1f2227",
                folded_section = "#56b6c2",
            },
            parts = { "header", "body1", "body2", "body3" },
        })
    end
}
