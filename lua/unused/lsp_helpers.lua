local M = {}

-- LSP UI configs
function M.configure_border_windows()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

function M.configure_error_windows()
	vim.diagnostic.config({
		virtual_text = true,
		severity_sort = true,
		float = {
			style = "minimal",
			border = "rounded",
			header = "",
			prefix = "",
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "✘",
				[vim.diagnostic.severity.WARN] = "▲",
				[vim.diagnostic.severity.HINT] = "⚑",
				[vim.diagnostic.severity.INFO] = "»",
			},
		},
	})
end

-- Mason + LSP + nvim-cmp setup
function M.setup_mason_and_cmp()
	require("mason").setup({})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"pylsp",
			"r_language_server",
		},
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
			lua_ls = function()
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = { vim.env.VIMRUNTIME } },
						},
					},
				})
			end,
		},
	})

	local cmp = require("cmp")
	local luasnip = require("luasnip")

	require("luasnip.loaders.from_vscode").lazy_load()

	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup({
		preselect = "item",
		completion = { completeopt = "menu,menuone,noinsert" },
		window = { documentation = cmp.config.window.bordered() },
		sources = {
			{ name = "path" },
			{ name = "nvim_lsp" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "luasnip", keyword_length = 2 },
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		formatting = {
			fields = { "abbr", "menu", "kind" },
			format = function(entry, item)
				local source = entry.source.name
				item.menu = source == "nvim_lsp" and "[LSP]" or string.format("[%s]", source)
				return item
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-f>"] = cmp.mapping.scroll_docs(5),
			["<C-u>"] = cmp.mapping.scroll_docs(-5),
			["<C-e>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.abort()
				else
					cmp.complete()
				end
			end),
			["<Tab>"] = cmp.mapping(function(fallback)
				local col = vim.fn.col(".") - 1
				if cmp.visible() then
					cmp.select_next_item({ behavior = "select" })
				elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
					fallback()
				else
					cmp.complete()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
			["<C-d>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
	})
end

return M
