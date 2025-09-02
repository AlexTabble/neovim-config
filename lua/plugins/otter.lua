return {
	-- If called here, it doesn't work. Idk why
	{ -- for lsp features in code cells / embedded code
		"jmbuhr/otter.nvim",
		dev = false,
		lazy = true,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
			},
		},
		opts = {},
		config = function()
			require("otter").setup({
				lsp = {
					hover = { "jedi_language_server", "r_language_server" },
					completion = { "jedi_language_server", "r_language_server" },
					diagnostics = { "jedi_language_server", "r_language_server" },
					definition = { "jedi_language_server", "r_language_server" },
				},
				buffers = {
					set_filetype = true,
				},
			})
		end,
	},
}
