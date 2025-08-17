return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	lazy = true,
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-ts-autotag", lazy = true },
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"json",
				"javascript",
				"query",
				"vimdoc",
				"yaml",
				"html",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"gitignore",
				"c",
			},

			auto_install = true,

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			rainbow = {
				enable = true,
				disable = { "html" },
				extended_mode = false,
				max_file_lines = nil,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
	-- make treesitter recognize qmd as md files
	vim.treesitter.language.register("markdown", { "quarto" }),
}
