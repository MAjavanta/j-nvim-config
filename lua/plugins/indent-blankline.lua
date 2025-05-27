return {
    "lukas-reineke/indent-blankline.nvim",
	lazy = false,
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
	config = function()
		require("ibl").setup()
	end
}

