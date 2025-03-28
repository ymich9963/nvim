return {
    "mbbill/undotree",
    keys = {
        {"<leader>ut", vim.cmd.UndotreeToggle, "n", desc = "Toggle Undotree"},
    },
    config = function ()
        if vim.fn.has "win32" == 1 then -- only windows
            vim.g.undotree_DiffCommand = vim.fn.stdpath('config') .. "\\bin\\diff.exe" -- path to valid diff.exe
        end
    end
}
