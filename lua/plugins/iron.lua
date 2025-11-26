return {
  {
    'Vigemus/iron.nvim',
    lazy = true,
    cmd = { 'IronRepl' },
    keys = { '<localleader>tr' },
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'
      local common = require 'iron.fts.common'

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { 'ipython', '--no-autoindent' },
              format = common.bracketed_paste_python,
            },
            r = {
              command = { 'R' },
            },
            quarto = {
              command = { 'ipython', '--no-autoindent' },
              -- command = {'R'},
              block_dividers = {
                '```{python}',
                '```{r}',
                '```',
              },
              format = common.bracketed_paste,
            },
            markdown = {
              command = { 'ipython', '--no-autoindent' },
              block_dividers = {
                '```python',
                '```r',
                '```',
              },
              send_code_block = common.markdown,
            },
          },
          repl_open_cmd = view.split.vertical.botright '40%',
        },

        keymaps = {
          toggle_repl = '<leader>tr',
          restart_repl = '<leader>tR',
          visual_send = '<leader>tc',
          send_file = '<leader>tf',
          send_line = '<leader>tl',
          send_paragraph = '<leader>tp',
          send_until_cursor = '<leader>tu',
          cr = '<leader>t<cr>',
          interrupt = '<leader>t<space>',
          exit = '<leader>tq',
          clear = '<leader>tcl',
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true,
      }
    end,
  },

  {
    'GCBallesteros/NotebookNavigator.nvim',
    lazy = true,
    ft = { 'quarto' },
    dependencies = {
      'Vigemus/iron.nvim',
      'anuvyklack/hydra.nvim',
    },
    config = function()
      require('notebook-navigator').setup {
        cell_markers = {
          quarto = '```',
          markdown = '```',
        },
      }
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      }

      vim.keymap.set('n', '<leader>tt', function()
        require('toggleterm.terminal').Terminal
          :new({
            cmd = os.getenv 'SHELL',
            hidden = true,
            direction = 'float',
          })
          :toggle()
      end, { desc = 'Open Terminal' })
    end,
  },
}
