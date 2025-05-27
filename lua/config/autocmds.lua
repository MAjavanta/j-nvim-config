local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm" })
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Core UI groups
		vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
		vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
		vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
		vim.cmd("highlight StatusLine guibg=NONE ctermbg=NONE")
		vim.cmd("highlight StatusLineNC guibg=NONE ctermbg=NONE")
		vim.cmd("highlight VertSplit guibg=NONE ctermbg=NONE")

		-- Optional: if using lualine, clear lualine-specific groups
		vim.cmd("highlight! link LualineNormal Normal")
		vim.cmd("highlight! link LualineInsert Normal")
		vim.cmd("highlight! link LualineVisual Normal")
		vim.cmd("highlight! link LualineReplace Normal")
		vim.cmd("highlight! link LualineCommand Normal")
		vim.cmd("highlight! link LualineInactive Normal")
	end,
})
