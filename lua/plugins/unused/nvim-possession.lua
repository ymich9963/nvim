return {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    config = function ()
        require("nvim-possession").setup({
            --[[ autoload = true, -- whether to autoload sessions in the cwd at startup
            autosave = true, -- whether to autosave loaded sessions before quitting
            autoswitch = {
                enable = true, -- whether to enable autoswitch
                -- exclude_ft = {}, -- list of filetypes to exclude from autoswitch
            }, ]]
        })

    end,
    keys = {
        { "<leader>sl", function() require("nvim-possession").list() end, desc = "List sessions", },
        { "<leader>sn", function() require("nvim-possession").new() end, desc = "Create new session", },
        { "<leader>su", function() require("nvim-possession").update() end, desc = "Update current session", },
        { "<leader>sd", function() require("nvim-possession").delete() end, desc = "Delete selected session"},
    },
}
