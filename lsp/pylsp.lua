return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},
	pythonPath = "~/.virtualenvs/neovim",
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
					ignore = { "E501", "E203", "E231", "E122" },
				},
			},
		},
	},
}
