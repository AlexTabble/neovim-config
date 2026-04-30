require 'config.global'
require 'config.lazy'
require 'config.autocommands'

-- vim.cmd.colorscheme 'tokyonight-night'
vim.cmd.colorscheme 'cyberdream'
-- vim.cmd.colorscheme 'rose-pine'

-- use latest treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})

-- transparent background if needed

-- vim.cmd([[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]])
--
