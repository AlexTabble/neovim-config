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
