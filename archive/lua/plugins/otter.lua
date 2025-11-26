return {
	-- If called here, it doesn't work. Idk why
	{ -- for lsp features in code cells / embedded code
		"jmbuhr/otter.nvim",
		dev = false,
		-- lazy = true,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
			},
		},
		opts = {},
		config = function()
			require("otter").setup({
				lspFeatures = {
					enabled = true,
					chunks = "curly",
				},
				buffers = {
					set_filetype = true,
					write_to_disk = false,
				},
				-- debug = true,
			})
		end,
	},
}
