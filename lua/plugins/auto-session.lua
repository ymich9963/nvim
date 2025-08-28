return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        lazy_support = true,
        auto_save = true,
        auto_restore = false, -- Enables/disables auto restoring session on start
        auto_create = false, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
        auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
        cwd_change_handling = true,
        session_lens = { picker = "select", }
    },
    keys = {
        { "<leader>sl", ":AutoSession search<CR>", desc = "List sessions", },
        { "<leader>ss", ":AutoSession save", desc = "Save session", },
        { "<leader>sd", ":AutoSession delete", desc = "Delete session", },
        { "<leader>sr", ":AutoSession restore", desc = "Restore session", },
    },
}
