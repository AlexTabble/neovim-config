return {
  {
    'lervag/vimtex',
    version = 'v2.15',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'

      -- Forward search from Neovim to PDF
      vim.g.vimtex_view_zathura_sync = 1
      vim.g.vimtex_view_zathura_activate = 1

      -- Quick compile toggle
      vim.keymap.set('n', '<leader>lc', ':VimtexCompile<CR>')
      vim.keymap.set('n', '<leader>lv', ':VimtexView<CR>')
      vim.keymap.set('n', '<leader>lk', ':VimtexStop<CR>')
    end,
  },
}
