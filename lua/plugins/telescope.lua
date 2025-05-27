local keymap = vim.keymap

local config = function()
	local telescope = require('telescope')
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = "which_key",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			find_buffers = {
				theme = "dropdown",
				previewer = false,
			},
			git_files = {
				theme = "dropdown",
			}
		},
	})
end

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{ 
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		}
	},
	config = config,
	keys = {
		{ "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
		{ "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
	},
}

