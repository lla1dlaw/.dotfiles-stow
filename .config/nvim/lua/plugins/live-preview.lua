return {
    'brianhuster/live-preview.nvim',
    dependencies = {
        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
        'ibhagwan/fzf-lua',
    },
    
    opts = {
        
    },

    config = function(_, opts) 
        require('livepreview.config').set(opts)
    end,
}
