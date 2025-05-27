return {
    "numToStr/Comment.nvim",
	lazy = false,
    config = function()
      require("Comment").setup()

		-- Comments
		vim.api.nvim_set_keymap('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)', { noremap = false } )
		vim.api.nvim_set_keymap('v', '<C-_>',  '<Plug>(comment_toggle_linewise_visual)', { noremap = false } )
		vim.api.nvim_set_keymap('n', '<C-b>', '<Plug>(comment_toggle_blockwise_current)', { noremap = false } )
		vim.api.nvim_set_keymap('v', '<C-b>', '<Plug>(comment_toggle_blockwise_visual)', { noremap = false } )
	end
}

