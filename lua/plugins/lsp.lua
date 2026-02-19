return {
  {
    'jmbuhr/otter.nvim',
    dev = false,
    lazy = true,
    ft = { 'quarto' },
    dependencies = {

      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'barreiroleo/ltex_extra.nvim',
    },
    ---@type OtterConfig
    opts = {},
  },

  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'VimEnter' },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim',
        opts = {
          automatic_enable = false,
          ensure_installed = {
            'lua_ls',
            'bashls',
            'ty',
            'r_language_server',
            'ts_ls',
            'yamlls',
            'clangd',
            -- 'marksman',
            'texlab',
            'sqlls',
            'html',
            'emmet_language_server',
            'ltex',
          },
        },
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'black',
            'stylua',
            'shfmt',
            'isort',
            'ruff',
            'tree-sitter-cli',
            'jupytext',
            'pyrefly',
          },
        },
      },
    },
    config = function()
      local util = require 'lspconfig.util'

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local function map(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          assert(client, 'LSP client not found')

          ---@diagnostic disable-next-line: inject-field
          client.server_capabilities.document_formatting = true

          map('gd', vim.lsp.buf.definition, '[g]o to [d]efinition')
          map('gD', vim.lsp.buf.type_definition, '[g]o to type [D]efinition')
          map('<leader>lq', vim.diagnostic.setqflist, '[l]sp diagnostic [q]uickfix')
        end,
      })

      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }

      local capabilities
      local has_blink, blink = pcall(require, 'blink')
      if has_blink then
        capabilities = blink.get_lsp_capabilities({}, true)
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end

      -- set defaults for all clients
      vim.lsp.config('*', {
        capabilities = capabilities,
        flags = lsp_flags,
        root_markers = { '.git/' },
      })

      -- also needs:
      -- $home/.config/marksman/config.toml :
      -- [core]
      -- markdown.file_extensions = ["md", "markdown", "qmd"]
      vim.lsp.config.marksman = {
        filetypes = { 'markdown' },
        root_dir = util.root_pattern('.git', '.marksman.toml', '_quarto.yml'),
      }

      vim.lsp.config.ltex = {
        on_attach = function()
          require('ltex_extra').setup {
            -- This is where your dictionary will be stored! Replace this path with
            -- whatever you want!
            path = vim.fn.expand '~' .. '/.config/nvim/ltex',
          }
          -- ...
        end,
        settings = {
          ltex = {
            additionalRules = {
              enablePickyRules = true,
            },
            language = 'en-ZA',
          },
        },
        filetypes = { 'markdown', 'text', 'tex', 'gitcommit', 'quarto' },
        flags = { debounce_text_changes = 300 },
      }

      vim.lsp.config.r_language_server = {
        filetypes = { 'r', 'rmarkdown' }, -- not directly using it for quarto (as that is handled by otter and often contains more languanges than just R)
        settings = {
          r = {
            lsp = {
              rich_documentation = true,
            },
          },
        },
      }

      vim.lsp.config.yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
              url = '',
            },
          },
        },
      }

      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              disable = { 'trailing-space' },
            },
            workspace = {
              checkThirdParty = false,
            },
            doc = {
              privateName = { '^_' },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      vim.lsp.sqlls = {
        capabilities = capabilities,
        -- filetypes = {"sql"},
      }

      vim.emmet_language_server = {
        capabilities = capabilities,
        filetypes = { 'html' },
      }

      vim.lsp.config.texlab = {
        capabilities = capabilities,
        filetypes = { 'tex', 'plaintex', 'bib' },
        settings = {
          texlab = {
            build = {
              executable = 'latexmk',
              args = { '-xelatex', '-interaction=nonstopmode', '-synctex=1', '-outdir=build', '%f' },
              forwardSearchAfter = true,
            },
            forwardSearch = {
              executable = 'zathura',
              args = { '--synctex-forward', '%l:1:%f', '%p' },
            },
            auxDirectory = 'build',
            completion = { matcher = 'fuzzy' },
          },
        },
      }

      vim.lsp.bashls = {
        filetypes = { 'sh', 'bash' },
      }

      vim.lsp.config.ty = {
        capabilities = capabilities,
        filetypes = { 'python', 'qmd' },
      }

      vim.lsp.ruff = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.pyrefly = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      if capabilities.workspace == nil then
        capabilities.workspace = {}
        capabilities.workspace.didChangeWatchedFiles = {}
      end
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

      vim.lsp.config.pyright = {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
        root_markers = { '.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt' },
      }
      -- enable the servers
      vim.lsp.enable 'yamlls'
      vim.lsp.enable 'lua_ls'

      vim.lsp.enable 'r_language_server'

      -- vim.lsp.enable 'ty'
      vim.lsp.enable 'pyrefly'
      vim.lsp.enable 'pyright'

      vim.lsp.enable 'ruff'
      -- vim.lsp.enable 'sqlls'

      -- vim.lsp.enable "html"
      -- vim.lsp.enable 'emmet_language_server'
      vim.lsp.enable 'bashls'

      vim.lsp.enable 'texlab'
      vim.lsp.enable 'ltex'
      vim.lsp.enable 'marksman'
    end,
  },
}
