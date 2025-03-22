return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        lazy_support = true,
        bypass_save_filetypes = { 'alpha', 'dashboard' },
        auto_save = true, -- Enables/disables auto saving session on exit
        auto_restore = true, -- Enables/disables auto restoring session on start
        auto_create = false, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
        auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
        cwd_change_handling = true,
        pre_cwd_changed_cmds = {},
        post_cwd_changed_cmds = {}
    },
    keys = {
        { "<leader>sl", ":SessionSearch<CR>", desc = "List sessions", },
        { "<leader>ss", ":SessionSave", desc = "Save session", },
        { "<leader>sd", ":SessionDelete", desc = "Delete session", },
        { "<leader>sr", ":SessionRestore", desc = "Restore session", },
    },
}
