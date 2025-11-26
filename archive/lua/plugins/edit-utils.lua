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
			local cmp_status, cmp = pcall(require, "blink")
			if cmp_status then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
	{ -- Comment enables keymap "gc" to comment visual regions/lines
		"numToStr/Comment.nvim",
		version = nil,
		cond = function()
			return vim.fn.has("nvim-0.10") == 0
		end,
		branch = "master",
		config = true,
	},

	{
		"hat0uma/csvview.nvim",
		ft = { "csv", "tsv" },
		lazy = true,
		config = function()
			require("csvview").setup({})
			vim.keymap.set("n", "<localleader>cv", "<cmd>CsvViewToggle <cr>", { desc = "Toggle [c]sv [v]iewer" })
		end,
	},

	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },

		--TODO: A Todo block
		--WARN: A Warning Block
		--NOTE: A Note Block
		--BUG: A bug block
		--PERF: A Test Block
	},

	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
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
		"lukas-reineke/virt-column.nvim",
		event = { "BufReadPre" },
		lazy = true,
		opts = {
			-- char = "|",
			-- char = "",
			-- char = "┇",
			-- char = "∶",
			-- char = "∷",
			-- char = "║",
			-- char = "⋮",
			-- char = "",
			char = "󰮾",
			virtcolumn = "80",
		},
	},
}

--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
