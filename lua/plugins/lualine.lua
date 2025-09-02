return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "VimEnter" },
		lazy = true,
		config = function()
			-- Setup lualine
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "branch" },
					lualine_c = { "diagnostics" },
					lualine_x = {},
					lualine_y = { "encoding", "filetype" },
					lualine_z = { "progress" },
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = { "diagnostics" },
					lualine_c = { "lsp_status" },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					lualine_a = { "tabs" },
				},
				extensions = { "oil" },
			})
		end,
	},
}
