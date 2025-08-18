return {

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
	},
}
