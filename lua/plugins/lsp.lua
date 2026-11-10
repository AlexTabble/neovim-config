return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'VimEnter' },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'barreiroleo/ltex_extra.nvim',
        ft = { 'markdown', 'tex', 'text', 'quarto' },
      },
      {
        'mason-org/mason-lspconfig.nvim',
        opts = {
          automatic_enable = false,
          ensure_installed = {
            'lua_ls',
            'bashls',
            'ty',
            'r_language_server',
            'yamlls',
            'clangd',
            'texlab',
            'rust_analyzer',
            'vale_ls',
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
            'pyright',
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
          -- map('K', vim.lsp.buf.hover, 'Hover')
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

      vim.lsp.config.ltex = {
        filetypes = { 'markdown', 'text', 'tex', 'gitcommit', 'quarto' },

        settings = {
          ltex = {
            language = 'en-ZA',

            additionalRules = {
              enablePickyRules = true,
            },
          },
        },

        on_attach = function(client, bufnr)
          require('ltex_extra').setup {
            path = vim.fn.expand '~/.config/nvim/ltex',
          }
        end,

        flags = {
          debounce_text_changes = 300,
        },
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

      vim.lsp.config.bashls = {
        filetypes = { 'sh', 'bash' },
      }

      vim.lsp.config.ty = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.config.ruff = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.config.clangd = {
        capabilities = capabilities,
      }

      vim.lsp.config.pyrefly = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.config.rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            imports = {
              granularity = {
                group = 'module',
              },
              prefix = 'self',
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
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
              diagnosticMode = 'openFilesOnly',

              typeCheckingMode = 'standard',
              autoImportCompletions = true,
            },
          },
        },

        root_markers = {
          '.git',
          'pyproject.toml',
          'setup.py',
          'setup.cfg',
          'requirements.txt',
          'poetry.lock',
          'uv.lock',
        },
      }

      vim.lsp.config.vale_ls = {
        capabilities = capabilities,
        filetypes = { 'markdown', 'quarto' },
        root_markers = { '.vale.ini', '.git' },
      }

      vim.lsp.enable 'lua_ls'

      vim.lsp.enable 'r_language_server'

      -- vim.lsp.enable 'pyrefly'
      vim.lsp.enable 'pyright'
      -- vim.lsp.enable 'ty'
      -- vim.lsp.enable 'ruff'

      vim.lsp.enable 'texlab'
      -- vim.lsp.enable 'ltex'
      -- vim.lsp.enable 'vale_ls'

      vim.lsp.enable 'rust_analyzer'
      vim.lsp.enable 'clangd'
    end,
  },
}
