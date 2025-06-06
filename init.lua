--Set some basic options and setup lazy package manager

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = vim.opt

opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.confirm = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 7
opt.colorcolumn = "110"

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.errorbells = false
opt.hidden = true

opt.splitright = true
opt.splitbelow = true

opt.mouse = "a"
opt.undofile = true
opt.encoding = "UTF-8"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("config.lazy")
