return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float",
				float_opts = {
					border = "curved",
				},
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("toggleterm.terminal").Terminal
					:new({
						cmd = os.getenv("SHELL"),
						hidden = true,
						direction = "float",
					})
					:toggle()
			end, { desc = "Open Terminal" })
		end,
	},
	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- 	vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>"),
	-- 	vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>"),
	-- 	vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>"),
	-- 	vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>"),
	-- },
}
