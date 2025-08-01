return {
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto", "markdown", "rmd", "qmd" },
		dependencies = { "nvim-telescope/telescope.nvim", "jmbuhr/otter.nvim" }, -- optional
		config = function()
			-- initialize the plugin
			require("quarto").setup({
				codeRunner = {
					enabled = true,
					default_method = "iron",
				},
				languages = { "r,", "python", "bash", "html" },
			})
		end,
	},
	{ -- directly open ipynb files as quarto docuements
		-- and convert back behind the scenes
		"GCBallesteros/jupytext.nvim",
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
				r = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		},
	},
}
