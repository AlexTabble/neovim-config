
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = { '*' },
  command = 'checktime',
})


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command("Activate", function()
	local cwd = vim.fn.getcwd()
	local venvs = { ".venv", "venv", "env" }

	for _, name in ipairs(venvs) do
		local venv_path = cwd .. "/" .. name
		if vim.fn.isdirectory(venv_path) == 1 then
			vim.env.VIRTUAL_ENV = venv_path
			vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
			vim.g.python3_host_prog = venv_path .. "/bin/python"
			print("🐍 Activated virtualenv: " .. venv_path)
			return
		end
	end
	print("⚠️ No venv found in " .. cwd)
end, {})

vim.api.nvim_create_user_command("Deactivate", function()
	if vim.env.VIRTUAL_ENV then
		print("🐍 Deactivated venv: " .. vim.env.VIRTUAL_ENV)
	else
		print("⚠️ No active venv.")
		return
	end

	-- Remove the venv's bin path from PATH
	local venv_bin = vim.env.VIRTUAL_ENV .. "/bin:"
	vim.env.PATH = vim.env.PATH:gsub(venv_bin, "")

	-- Unset the environment variables
	vim.env.VIRTUAL_ENV = nil
	vim.g.python3_host_prog = nil

	print("✅ Virtual environment deactivated.")
end, {})
