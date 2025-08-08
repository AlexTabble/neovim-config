return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"~/Projects/*",
			"~/.config/nvim",
			"~/Documents/ObVault",
		},
		picker = {
			type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
		},
		last_session_on_startup = false,
	},

	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		vim.keymap.set("n", "<leader>nn", function()
			vim.cmd("NeovimProjectLoad ~/.config/nvim")
		end, { desc = "Open nvim config" })

		vim.keymap.set("n", "<leader>no", function()
			vim.cmd("NeovimProjectLoad ~/Documents/ObVault")
		end)

		vim.keymap.set("n", "<leader>np", function()
			vim.cmd("NeovimProjectDiscover")
		end, { desc = "Pick Project" })
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },

		{ "Shatur/neovim-session-manager", lazy = true },
	},
	cmd = { "NeovimProjectDiscover", "NeovimProjectLoad" },
	lazy = true,
	priority = 100,
}
