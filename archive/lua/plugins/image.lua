return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		lazy = true,
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		lazy = true,
		dependencies = { "luarocks.nvim" },
		config = function()
			require("image").setup({
				backend = "kitty",
				kitty_method = "normal",
				max_height_window_percentage = 50,
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
				filetypes = { "markdown", "quarato" },
			})
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			-- add options here
			-- or leave it empty to use the default settings
			default = {
				dir_path = "Assets",
			},
		},
		keys = {
			-- suggested keymap
			{ "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
