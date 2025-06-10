local config = function()
	require("nvim-treesitter.configs").setup({
        modules = {},
        ignore_install = {},
        sync_install = false,
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"markdown",
			"python",
			"lua",
			"gitignore",
			"dockerfile",
			"c",
			"html",
            "javascript",
            "typescript",
            "tsx",
            "css"
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	config = config,
}
