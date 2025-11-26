return {
	"GCBallesteros/NotebookNavigator.nvim",
	lazy = true,
	ft = { "quarto" },
	keys = {
		{
			"]h",
			function()
				require("notebook-navigator").move_cell("d")
			end,
		},
		{
			"[h",
			function()
				require("notebook-navigator").move_cell("u")
			end,
		},
		{ "<leader>tb", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
		-- { "<leader><leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
	},
	dependencies = {
		-- "echasnovski/mini.comment",
		"hkupty/iron.nvim", -- repl provider
		"anuvyklack/hydra.nvim",
	},
	-- event = "VeryLazy",
	config = function()
		require("notebook-navigator").setup({
			cell_markers = {
				quarto = "```",
				markdown = "```",
			},
		}) -- KHÔNG truyền activate_hydra_keys vào
	end,
}
