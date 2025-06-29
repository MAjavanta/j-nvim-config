local config = function()
	require("neoconf").setup({})
	local lspconfig = require("lspconfig")

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
	})

	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		-- Native LSP keymaps
		local map = vim.keymap.set

		-- LSP basic navigation
		map("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Show definitions/references (Lspsaga)
		map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek definition in floating window
		map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- Go to definition (enhanced)
		map("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation (native)
		map("n", "gr", vim.lsp.buf.references, opts) -- Find references (native)

		-- LSP hover and actions
		map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- Hover documentation (enhanced)
		map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code action menu (enhanced)
		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- Rename symbol (enhanced)

		-- Diagnostics
		map("n", "gl", function()
			vim.diagnostic.open_float({})
		end, opts) -- Show diagnostics in a floating window
		map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Jump to previous diagnostic (enhanced)
		map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Jump to next diagnostic (enhanced)
	end

	-- Lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {

					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})

	local luacheck = {
		lintCommand = "luacheck --globals vim --codes --no-color --quiet -",
		lintStdin = true,
		lintFormats = { "%.%#:%l:%c: (%t%n) %m" },
	}

	local stylua = require("efmls-configs.formatters.stylua")

	local clangformat = {
		formatCommand = "clang-format --assume-filename=" .. vim.api.nvim_buf_get_name(0),
		formatStdin = true,
	}

	local black = {
		formatCommand = "black --quiet -",
		formatStdin = true,
	}

	local ruff = {
		lintCommand = "ruff check --quiet ${FILENAME}",
		lintFormats = { "%f:%l:%c: %m" },
		lintStdin = false,
	}

	local prettier = {
		formatCommand = "prettier --stdin-filepath ${INPUT}",
		formatStdin = true,
	}

	local eslint = {
		lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
		lintStdin = true,
		lintFormats = { "%f:%l:%c: %m" },
	}

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"c",
			"cpp",
			"python",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"html",
			"css",
			"json",
		},
		on_attach = on_attach,
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				c = { clangformat },
				cpp = { clangformat },
				python = { ruff, black },
				javascript = { eslint, prettier },
				javascriptreact = { eslint, prettier },
				typescript = { eslint, prettier },
				typescriptreact = { eslint, prettier },
				html = { prettier },
				css = { prettier },
				json = { prettier },
			},
		},
	})

	lspconfig.pyright.setup({
		on_attach = on_attach,
	})

	lspconfig.clangd.setup({
		on_attach = on_attach,
		cmd = { "clangd", "--background-index" },
	})

	lspconfig.html.setup({
		on_attach = on_attach,
	})

	lspconfig.cssls.setup({
		on_attach = on_attach,
	})

	lspconfig.ts_ls.setup({
		on_attach = on_attach,
	})

	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true,
				},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
