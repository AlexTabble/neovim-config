require 'config.global'
require 'config.lazy'
require 'config.autocommands'


require('nvim-web-devicons').set_icon {
  qmd = {
    icon = '',
    color = '#519aba',
    name = 'Quarto',
  },
}

vim.cmd.colorscheme 'tokyonight-night'
-- vim.cmd.colorscheme 'cyberdream'
-- vim.cmd.colorscheme 'rose-pine'
-- vim.cmd.colorscheme 'gruvbox'

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })

-- vim.cmd([[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]])
