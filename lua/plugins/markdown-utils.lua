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
				blink = true,
			},

			notes_subdir = "Fleeting Notes",
			new_notes_location = "notes_subdir",

			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					suffix = title:gsub(" ", "-"):lower()
				else
					suffix = tostring(os.time())
				end
				return suffix
			end,

			note_frontmatter_func = function(note)
				local parent = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
				return {
					tags = { parent },
					aliases = { note.title },
				}
			end,

			follow_url_func = function(url)
				vim.fn.jobstart({ "xdg-open", url }, { detach = true })
			end,

			ui = {
				enable = false, -- move this here if you want UI disabled
			},
		},
		keys = {
			{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New Note" },
			{ "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
			{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show Backlinks" },
		},
	},
}
