return {
    'brianhuster/live-preview.nvim',
    config = function ()
        require('livepreview.config').set({
            port = 55555,
        })
    end,
    cmd = {"LivePreview"}
}
