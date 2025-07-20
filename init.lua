-- Super Important Keymaps --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Initialize Settings --
require("config.settings")

-- Initialize Lazy --
require("config.lazy")

-- Initialzie Autocommands
require("config.autocommands")

-- Initialize Keymaps --
require("config.keymaps")

-- Set colorscheme --
vim.cmd.colorscheme("tokyonight")
