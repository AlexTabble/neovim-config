return {
	{ -- show tree of symbols in the current file
		"stevearc/aerial.nvim",
		keys = {
			{ "<leader>do", "<cmd>AerialToggle<CR>", desc = "Toggle [d]ocument [o]utline (aerial)" },
			{ "<leader>dn", "<cmd>AerialNavToggle<CR>", desc = "Toggle [d]ocument [n]avigator (aerial)" },
		},
		opts = {
			layout = { min_width = 25 },
		},
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		ft = "python",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
	},
	-- {
	--     "nvim-neo-tree/neo-tree.nvim",
	--     branch = "v3.x",
	--     dependencies = {
	--         "nvim-lua/plenary.nvim",
	--         "nvim-tree/nvim-web-devicons",
	--         "MunifTanjim/nui.nvim",
	--         "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	--     },
	--     opts = {
	--         filesystem = {
	--             filtered_items = {
	--                 visible = true,
	--                 hide_dotfiles = false,
	--                 hide_gitignored = true,
	--             },
	--         },
	--     },
	-- },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
