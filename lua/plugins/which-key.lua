return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
		key_labels = {
			["<leader>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},
		window = {
			border = "single",
		},
		layout = {
			align = "center",
		},
		ignore_missing = false,
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>q", group = "Quarto" },

			{ "<leader>c", group = "CSV" },

			{ "<leader>d", group = "Buffer Outline" },

			{ "<leader>D", group = "Diagnostics" },

			{ "<leader>e", group = "Oil" },

			{ "<leader>m", group = "Mark" },

			{ "<leader>f", group = "Find" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },

			{ "<leader>t", group = "Terminal" },

			{ "<leader>n", group = "Project" },
			{ "<leader>nn", desc = "Open nvim config" },
			{ "<leader>nc", desc = "Open .config" },
			{ "<leader>no", desc = "Open Vault" },

			{ "<leader>o", desc = "Obsidian" },

			{ "<leader>p", desc = "Preview" },
			{ "<leader>g", desc = "Open git terminal" },

			{ "<leader>?", group = "Show All" },

			{ "<leader>" },
		})
	end,
}
