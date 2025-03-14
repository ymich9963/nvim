return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        -- suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        -- log_level = 'debug',
        lazy_support = true
    },
    config = function ()
        vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
}
