vim.lsp.enable({
	"lua_ls",
	"marksman",
	-- "pylsp",
	"jedi-language-server",
	-- "basedpyright",
	-- "r_language_server",
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Define the basedpyright client config
local basedpyright_config = {
	name = "basedpyright",
	cmd = { "basedpyright-langserver", "--stdio" },
	root_dir = vim.loop.cwd, -- or implement your own root detection
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "basic",
				useLibraryCodeForTypes = true,
			},
		},
	},
	filetypes = { "python" },
}

-- Autocommand to start basedpyright only for .py files
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		-- check if already attached
		for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
			if client.name == "basedpyright" then
				return
			end
		end

		-- start the LSP client
		local client_id = vim.lsp.start_client(basedpyright_config)
		-- attach it to the current buffer
		vim.lsp.buf_attach_client(bufnr, client_id)
	end,
})
