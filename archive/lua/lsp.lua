vim.lsp.config("*", {
	on_attach = function(client, bufnr)
		-- overwrites omnifunc/tagfunc set by some Python plugins to the
		-- default values for LSP
		vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
		vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })

		vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover, { buffer = bufnr })
		vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, { buffer = bufnr })
		vim.keymap.set("n", "gu", vim.lsp.buf.references, { buffer = bufnr })
		vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = bufnr })

		-- vim.lsp.inlay_hint.enable(true)

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			signs = true,
			underline = true,
			virtual_text = true,
		})
	end,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- can use "▶", "•", etc.
		spacing = 2,
	},
	signs = true,
	underline = true,
	update_in_insert = false, -- set true if you want live linting while typing
})

vim.lsp.enable({
	"lua_ls",
	-- "pyrefly",
	-- "basedpyright",
	-- "pylsp",
	"marksman",
	-- "r-language-server",
	"ty",
	"ruff",
})
