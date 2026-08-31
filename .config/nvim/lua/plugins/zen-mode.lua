return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			width = 80, -- The width of your "document page"
            backdrop = 0.95,
			options = {
				signcolumn = "yes",
				number = true,
				relativenumber = true,
                cursorline = true,
                cursorcolumn = true,
				-- These native settings handle the Google Docs "wrapping" feel
				wrap = true,
				linebreak = true, -- Wraps at whole words, not mid-word
				breakindent = true, -- Keeps indentation on wrapped lines
			},
		},
        plugins = {
            options = {
                ruler = true,
                showcmd = true,
                laststatus = 1,
            },
            gitsigns = { enabled = true },
            tmux = { enabled = true },
        },

        on_open = function(win)
        end, 

        on_close = function(win)
            vim.cmd('q')
        end,
	},


	config = function() 
        -- Create the autocommands for activating zenmode on specific filetypes detecting specific filetypes
        
        local prose_group = vim.api.nvim_create_augroup("ProseWriting", { clear = true })

        -- Automatically trigger Zen Mode for specific filetypes
        vim.api.nvim_create_autocmd("FileType", {
          group = prose_group,
          pattern = { "markdown", "text", "tex" },
          callback = function()
            -- Small delay ensures the buffer is fully loaded before opening the floating window
            vim.defer_fn(function()
              require("zen-mode").toggle({
                window = { width = 85 } -- Adjust your page width here
              })
            end, 10)
          end,
        })

        -- (Optional) Turn it off if you switch to a code buffer in the same window
        vim.api.nvim_create_autocmd("BufEnter", {
          group = prose_group,
          callback = function()
            local ft = vim.bo.filetype
            if ft ~= "markdown" and ft ~= "text" and ft ~= "tex" then
              -- If Zen Mode is active, close it
              local zen = require("zen-mode.view")
              if zen.is_open() then
                zen.close()
              end
            end
          end,
        })
    end,
}
