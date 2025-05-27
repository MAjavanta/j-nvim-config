local config = function()
	local theme = require('lualine.themes.rose-pine')
	theme.normal.c.bg = nil
	require('lualine').setup({
		options = {
			globalisation = true,
		},
		sections = {
			lualine_a = {
				'buffers',
			}
		},
	})
end

return {
    'nvim-lualine/lualine.nvim',
	lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = config,
}
