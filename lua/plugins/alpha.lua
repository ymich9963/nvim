return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        vim.keymap.set("n", "<leader>H", ":Alpha<CR>", {desc = "Go to Alpha home page"})

        local startify = require("alpha.themes.startify")
        -- local theta = require("alpha.themes.theta")

        -- falls back to devicons without this anyway
        -- startify.file_icons.provider = "devicons"

        local custom_header = {
            type = "text",
            -- val = {
            --     [[                                  __]],
            --     [[     ___     ___    ___   __  __ /\_\    ___ ___]],
            --     [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
            --     [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
            --     [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            --     [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            -- },
            val = {[[Home]]},
            opts = {
                hl = "Type",
                shrink_margin = false,
                -- wrap = "overflow";
            },
        }

        startify.section.header = custom_header

        startify.config = {
            layout = {
                { type = "padding", val = 5 },
                startify.section.header,
                { type = "padding", val = 2 },
                -- startify.section.top_buttons,
                startify.section.mru_cwd,
                startify.section.mru,
                { type = "padding", val = 1 },
                -- startify.section.bottom_buttons,
                startify.section.footer,
            },
            opts = {
                margin = 3,
                redraw_on_resize = false,
                setup = function()
                    vim.api.nvim_create_autocmd('DirChanged', {
                        pattern = '*',
                        group = "alpha_temp",
                        callback = function ()
                            require('alpha').redraw()
                            vim.cmd('AlphaRemap')
                        end,
                    })
                end,
            },
        }

        require("alpha").setup(startify.config)
        -- require("alpha").setup(theta.config)
    end
}
