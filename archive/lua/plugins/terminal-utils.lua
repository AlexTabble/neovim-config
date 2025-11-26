return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "vertical",
				float_opts = {
					border = "curved",
				},
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("toggleterm.terminal").Terminal
					:new({
						cmd = os.getenv("SHELL"),
						hidden = true,
						direction = "vertical",
					})
					:toggle()
			end, { desc = "Open Terminal" })
		end,
	},
}
