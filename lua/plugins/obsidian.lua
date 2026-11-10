return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = { 'markdown' },
  lazy = true,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
    'nvim-telescope/telescope.nvim',
  },

  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/ObVault',
      },
    },
    legacy_commands = false,

    new_notes_subdir = 'Fleeting Notes',

    -- [[My Note]] → 'My Note.md'
    note_id_func = function(title)
      if title ~= nil then
        return title
      else
        return tostring(os.time())
      end
    end,

    attachments = {
      folder = 'Assets',
    },

    ui = {
      enable = false,
    },

    -- completion = {
    --   -- blink = true,
    --   nvim_cmp = false,
    --   min_chars = 2,
    -- },

    picker = {
      name = 'telescope.nvim',
    },

    frontmatter = {
      func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if note.metadata ~= nil then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
    },
  },
}
