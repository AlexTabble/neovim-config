return {
	{
		"vim-latex/vim-latex",
		ft = { "markdown" },
		lazy = true,
		init = function()
			vim.g.tex_flavor = "latex"
			vim.g.imap_leader = ";"
			vim.g.tex_indent_items = 0
			vim.g.latex_suite_menu = 0
		end,
	},

	{
		"jbyuki/nabla.nvim",
		lazy = true,
		ft = { "markdown", "tex" },
		keys = {
			{
				"<leader>pe",
				function()
					require("nabla").popup()
				end,
				desc = "Preview Math (popup)",
			},
			{
				"<leader>pv",
				function()
					require("nabla").enable_virt()
				end,
				desc = "Enable inline math",
			},
		},
	},
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		lazy = true,
		dependencies = { "lervag/vimtex", "L3MON4D3/LuaSnip" },
		config = function()
			require("luasnip-latex-snippets").setup({
				use_treesitter = true,
				allow_on_markdown = true,
			})
		end,
	},
}
