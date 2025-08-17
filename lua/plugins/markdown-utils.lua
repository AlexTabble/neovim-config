return {
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown",
		ft = "markdown",
		opts = {
			headings = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- Nerd Font icons
			bullets = { "●", "○", "◆", "◇" },
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Documents/ObVault/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Documents/ObVault/*.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "vault",
					path = "~/Documents/ObVault",
				},
			},

			completion = {
				cmp = true,
			},
			picker = {
				name = "telescope.nvim",
			},

			notes_subdir = "Fleeting Notes",
			new_notes_location = "notes_subdir",

			-- Make filename = title so links match exactly in Obsidian
			note_id_func = function(title)
				if title ~= nil then
					return title -- exact title for filename
				else
					return tostring(os.time()) -- fallback for untitled
				end
			end,

			-- Frontmatter: keep tags, use title as frontmatter title, no aliases needed
			note_frontmatter_func = function(note)
				local parent = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
				return {
					title = note.title or note.id,
					tags = { parent },
				}
			end,

			follow_url_func = function(url)
				vim.fn.jobstart({ "xdg-open", url }, { detach = true })
			end,

			ui = {
				enable = false,
			},
		},
		keys = {
			{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New Note" },
			{ "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
			{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show Backlinks" },
			{ "<leader>oh", "<cmd> edit ~/Documents/ObVault/Nvim Navigation.md<CR>", desc = "Home" },
		},
	},
}
