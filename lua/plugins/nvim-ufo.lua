return {
	"kevinhwang91/nvim-ufo",
	lazy = false,
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter", -- required for treesitter fold provider
	},
	config = function()
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
		-- Optionally set default fold level to avoid opening all folded
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		-- Code folding
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor)
	end,
}
