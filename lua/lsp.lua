vim.lsp.enable({
	"lua_ls",
	"marksman",
	"pylsp",
	"r_language_server",
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})
