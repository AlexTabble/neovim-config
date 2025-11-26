return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {
			auto_update = false,
			run_on_start = false,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = {
			"mason-org/mason.nvim",
			{ "j-hui/fidget.nvim", lazy = true },
		},
		lazy = true,
		cmd = { "MasonToolsUpdate" },
		config = function()
			local installer = require("mason-tool-installer")
			installer.setup({
				ensure_installed = {
					"lua-language-server",
					"marksman",
					"stylua",
					"pyrefly",
				},
				integrations = {
					["mason-lspconfig"] = false,
					["mason-null-ls"] = false,
					["mason-nvim-dap"] = false,
				},
			})
		end,
	},
}
