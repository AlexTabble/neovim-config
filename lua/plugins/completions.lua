return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			-- "rafamadriz/friendly-snippets",
			"epwalsh/obsidian.nvim", -- Optional: for [[link]] completion
			"onsails/lspkind.nvim",
		},
		event = { "InsertEnter" },
		lazy = true,
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.setup({
				enable_autosnippets = true, -- This is required for auto-triggering
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-Y>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- "symbol" or "text" or "symbol_text"
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "obsidian" }, -- [[link]] completion
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = true,
				},
			})

			-- Optionally configure cmdline completion (e.g., `/`, `:`)
			-- cmp.setup.cmdline("/", {
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = {
			-- 		{ name = "buffer" },
			-- 	},
			-- })
			--
			-- cmp.setup.cmdline(":", {
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = cmp.config.sources({
			-- 		{ name = "path" },
			-- 	}, {
			-- 		{ name = "cmdline" },
			-- 	}),
			-- })
		end,
	},
}
