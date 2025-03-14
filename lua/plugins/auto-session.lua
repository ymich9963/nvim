return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        log_level = 'debug',
        enabled = true,
        lazy_support = true,
        root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Root dir where sessions will be stored
        session_control = {
            control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
            control_filename = "session_control.json", -- File name of the session control file
        },
        bypass_save_filetypes = { 'alpha', 'dashboard' },
    },
    config = function ()
        vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
}
