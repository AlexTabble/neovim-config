return {
	{

		"navarasu/onedark.nvim",
		lazy = true,
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
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("kanagawa").setup({})
		end,
	},
	{
		"everviolet/nvim",
		name = "evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			theme = {
				variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
				accent = "red",
			},
			editor = {
				transparent_background = false,
				sign = { color = "none" },
				float = {
					color = "mantle",
					solid_border = false,
				},
				completion = {
					color = "surface0",
				},
			},
		},
	},
}
