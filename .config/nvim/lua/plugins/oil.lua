return {
	"stevearc/oil.nvim",
	lazy = false, 
	dependencies = {
        "nvim-tree/nvim-web-devicons",
    }, 
	opts = {
        delete_to_trash = true, -- use system trash 
        default_file_explorer = true,  -- replace netrw
        columns = { 'icon', 'size' },
        keymaps = {
            ['<CR>'] = 'actions.select',
            ['-']    = 'actions.parent',
            ['_']    = 'actions.open_cwd',
        },
        view_options = { 
            show_hidden = true,
            is_always_hidden = function(name, _)
                return name == "." or name == ".."
            end,
        },
    },

    keys = {
        { '<leader>-', '<CMD>Oil<CR>', desc = 'Open parent directory' }
    }
}
