-- plugins/lsp/_setup.lua
local borders = require("plugins.lsp._borders")
local diagnostics = require("plugins.lsp._diagnostics")
local formatting = require("plugins.lsp._formatting")
local handlers = require("plugins.lsp._handlers")

borders.configure()
diagnostics.configure()
handlers.setup()
handlers.setup_mason_and_cmp()
formatting.setup()
