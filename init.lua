-- Super Important Keymaps --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("settings")

require("lsp")

require("lazy-bootsrap")

require("lazy-plugins")

require("keymaps")

-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("tokyonight-night")
vim.cmd.colorscheme("kanagawa-wave")
-- vim.cmd.colorscheme("evergarden")
