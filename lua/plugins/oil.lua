return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            columns = {
                {"icon", add_padding = true},
                -- "permissions",
                {"size", highlight= "Constant"},
                {"mtime", highlight= "@lsp.type.property", format= "%d/%m/%y %T"},
                -- {"ctime", format="%D %T"},
                {"type", highlight= "Special"},
            },
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = true,
            -- Set to true to watch the filesystem for changes and reload oil
            watch_for_changes = true,
            -- Set to false to disable all of the above keymaps
            view_options = { show_hidden = true, },
        })
        vim.keymap.set("n","<leader>o",function () vim.cmd({cmd="Oil"}) require("oil.actions").cd.callback({scope="tab",silent=true})
        end)
    end,
}
