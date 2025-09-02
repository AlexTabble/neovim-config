---@brief
---
--- https://github.com/artempyanykh/marksman
---
--- Marksman is a Markdown LSP server providing completion, cross-references, diagnostics, and more.
---
--- Marksman works on MacOS, Linux, and Windows and is distributed as a self-contained binary for each OS.
---
--- Pre-built binaries can be downloaded from https://github.com/artempyanykh/marksman/releases

local bin_name = "marksman"
local cmd = { bin_name, "server" }
local otter = require("otter")

return {
	cmd = cmd,
	otter.activate(),
	filetypes = { "markdown" },
	root_markers = { ".marksman.toml", "_quarto.yml", ".git", ".md" },
}
