return {
  {
    'nvim-treesitter/nvim-treesitter',
    dev = false,
    branch = 'main',

    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        init = function()
          -- Disable entire built-in ftplugin mappings to avoid conflicts.
          -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
          vim.g.no_plugin_maps = true
        end,

        config = function()
          require('nvim-treesitter-textobjects').setup {
            select = {
              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,
            },
          }

          -- temp keymaps
          vim.keymap.set({ 'n' }, '<leader>4', function()
            local parser = vim.treesitter.get_parser(0)
            local root = parser:parse()[1]:root()
            local query = vim.treesitter.query.parse('markdown', '(fenced_code_block (info_string (language) @lang))')
            for _, node in query:iter_captures(root, 0) do
              local text = vim.treesitter.get_node_text(node, 0)
              print(string.format("language node text: '%s'", text))
            end
          end)

          vim.keymap.set({ 'n' }, '<leader>5', function()
            local query_files = vim.treesitter.query.get_files('markdown', 'highlights')
            print(string.format('Current Files:', query_files))
          end)

          -- select
          vim.keymap.set({ 'x', 'o' }, 'am', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'im', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ac', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ic', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ib', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@block.inner', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ab', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@block.outer', 'textobjects')
          end)
        end,
      },
    },

    run = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'
      ---@diagnostic disable-next-line: missing-fields

      vim.treesitter.language.register('markdown', { 'quarto' })
      ts.setup {}
      ts.install {
        'r',
        'python',
        'markdown',
        'markdown_inline',
        'julia',
        'bash',
        'yaml',
        'lua',
        'vim',
        'regex',
        'query',
        'vimdoc',
        'latex', -- requires tree-sitter-cli (installed automatically via Mason)
        'html',
        'css',
        'dot',
        'javascript',
        'mermaid',
        'typescript',
      }
    end,
  },
}
