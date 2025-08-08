return {
	{

		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
			})
		end,
	},
}
