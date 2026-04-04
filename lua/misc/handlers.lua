local M = {}

local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local vault = vim.fn.expand '~/Documents/ObVault/'

-- what happens when you press <CR>
local function insert_link(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  actions.close(prompt_bufnr)

  if not entry then
    return
  end

  -- entry.filename works for live_grep results
  local file = entry.filename or entry.path
  if not file then
    return
  end

  local note = vim.fn.fnamemodify(file, ':t:r') 
  local link = string.format('[[%s]]', note)

  vim.api.nvim_put({ link }, 'c', true, true)
end

function M.search_and_link()
  builtin.live_grep {
    cwd = vault,
    prompt_title = 'Vault Grep → Insert Link',

    additional_args = function()
      return {
        '--glob',
        '*.md', 
        '--glob',
        '!Excalidraw/**', 
        '--glob',
        '!Assets/**', 
        '--glob',
        '!.obsidian/**', 
      }
    end,

    attach_mappings = function(_, map)
      map('i', '<CR>', insert_link)
      map('n', '<CR>', insert_link)
      return true
    end,
  }
end

return M
