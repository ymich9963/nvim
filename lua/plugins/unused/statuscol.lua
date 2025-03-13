return { -- TODO:
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            segments = {
                { text = { builtin.foldfunc }, maxwidth = 1, colwidth = 1, auto = true, wrap = true, click = "v:lua.ScFa" },
                -- { text = { "%s" }, click = "v:lua.ScSa" },
                { sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true, wrap = true }, click = "v:lua.ScSa"},
                { text = { builtin.lnumfunc, " " }, condition = { true, builtin.not_empty }, click = "v:lua.ScLa"}
            }
        })
    end,
}
