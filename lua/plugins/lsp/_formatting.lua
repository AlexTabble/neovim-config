local M = {}

local filetypes = { "lua", "python", "r" }

function M.setup()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			if vim.tbl_contains(filetypes, vim.bo.filetype) then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format({
							bufnr = args.buf,
							id = client.id,
							formatting_options = { tabSize = 4, insertSpaces = true },
						})
					end,
				})
			end
		end,
	})
end

return M
