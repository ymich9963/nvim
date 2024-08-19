return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- I'm not sure how to make this work but another method is
        -- installing fzf manually...
        -- { "junegunn/fzf", build = "./install --bin" },
    },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<c-p>", require('fzf-lua').files, { desc = "Fzf files" })
        vim.keymap.set("n", "<c-o>", require('fzf-lua').resume , { desc = "Fzf resume" })
        vim.keymap.set({"n", "v", "i"}, "<C-x><C-f>",
            function()
                require("fzf-lua").complete_file({
                cmd = "rg --files",
                winopts = { preview = { hidden = "nohidden" } }
            })
            end,
        { silent = true, desc = "Fuzzy complete file" })
        vim.keymap.set({"n", "v", "i"}, "<C-x><C-g>",
            function()
                require("fzf-lua").complete_path()
            end,
        { silent = true, desc = "Fuzzy complete path" })
    end
};
