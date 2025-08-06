return {
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- load only when entering Insert mode
		config = function()
			local npairs = require("nvim-autopairs")

			npairs.setup({
				check_ts = true, -- enables treesitter support
				disable_filetype = { "TelescopePrompt", "vim" }, -- disable in certain filetypes
			})

			-- Completion for autopairs
			local cmp_status, cmp = pcall(require, "cmp")
			if cmp_status then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
	{ -- Comment enables keymap "gc" to comment visual regions/lines
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	{ -- format things as tables
		"godlygeek/tabular",
		keys = {
			{ "<leader>ct", "<cmd>Tabularize /|<cr>", desc = "[C]ode [T]abularise" },
		},
	},
	{
		"hat0uma/csvview.nvim",
		ft = { "csv", "tsv" },
		config = function()
			require("csvview").setup({})
			vim.keymap.set("n", "<localleader>cv", "<cmd>CsvViewToggle <cr>", { desc = "Toggle [c]sv [v]iewer" })
		end,
	},
}
