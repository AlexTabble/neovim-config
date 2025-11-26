-- after/ftplugin/markdown.lua

-- Insert ** ** and move cursor between them
vim.keymap.set("i", "<C-b>", function()
	local keys = vim.api.nvim_replace_termcodes("****<Left><Left>", true, false, true)
	vim.api.nvim_feedkeys(keys, "i", true)
end, { buffer = true })

-- Insert * * (or == == if you prefer highlight) and move cursor between
vim.keymap.set("i", "<C-i>", function()
	local keys = vim.api.nvim_replace_termcodes("**<Left>", true, false, true)
	vim.api.nvim_feedkeys(keys, "i", true)
end, { buffer = true })

vim.keymap.set("n", "<leader>lt", function()
	local buf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_active_clients({ bufnr = buf })
	if not vim.tbl_isempty(clients) then
		print("Lsp already attached")
	else
		require("otter").activate()
	end
end, { desc = "Attach lsp" })

-- require("luarocks").enable()
require("image").enable()
