return {
	-- {
	--
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = true,
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	opts = {},
	-- },
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("tokyonight").setup({})
		end,
	},
	-- {
	-- 	"rijulpaul/nightblossom.nvim",
	-- 	name = "nightblossom",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme nightblossom")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("kanagawa").setup({})
	-- 	end,
	-- },
	-- {
	-- 	"everviolet/nvim",
	-- 	name = "evergarden",
	-- 	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	-- 	lazy = true,
	-- 	opts = {
	-- 		theme = {
	-- 			variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
	-- 			accent = "red",
	-- 		},
	-- 		editor = {
	-- 			transparent_background = false,
	-- 			sign = { color = "none" },
	-- 			float = {
	-- 				color = "mantle",
	-- 				solid_border = false,
	-- 			},
	-- 			completion = {
	-- 				color = "surface0",
	-- 			},
	-- 		},
	-- 	},
	-- },
}
