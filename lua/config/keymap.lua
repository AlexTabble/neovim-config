-- required in which-key plugin spec in plugins/ui.lua as `require 'config.keymap'`
local wk = require 'which-key'
local ms = vim.lsp.protocol.Methods


local nmap = function(key, effect, desc)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true, desc = desc })
end

local vmap = function(key, effect, desc)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true, desc = desc })
end

local imap = function(key, effect, desc)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true, desc = desc })
end

local cmap = function(key, effect, desc)
  vim.keymap.set('c', key, effect, { silent = true, noremap = true, desc = desc })
end

-- select last paste
nmap('gV', '`[v`]')

-- move in command line
cmap('<C-a>', '<Home>')

-- save with ctrl+s
imap('<C-s>', '<esc>:update<cr><esc>')
nmap('<C-s>', '<cmd>:update<cr><esc>')

-- Quit
nmap('<leader>x', '<cmd>:q<cr>')

nmap('|', '<CMD>vsplit<CR>')
nmap('_', '<CMD>split<CR>') -- I basically never use this keymap
-- Move between windows using <ctrl> direction
nmap('<C-j>', '<C-W>j')
nmap('<C-k>', '<C-W>k')
nmap('<C-h>', '<C-W>h')
nmap('<C-l>', '<C-W>l')

-- Resize window using <shift> arrow keys
nmap('<S-Up>', '<cmd>resize +2<CR>')
nmap('<S-Down>', '<cmd>resize -2<CR>')
nmap('<S-Left>', '<cmd>vertical resize -2<CR>')
nmap('<S-Right>', '<cmd>vertical resize +2<CR>')

-- keep selection after indent/dedent
vmap('>', '>gv')
vmap('<', '<gv')

-- center after search and jumps
nmap('n', 'nzz')
nmap('<c-d>', '<c-d>zz')
nmap('<c-u>', '<c-u>zz')

-- move between splits and tabs
-- move between splits and tabs
local function smart_move(direction, tmux_cmd)
  local curwin = vim.api.nvim_get_current_win()
  vim.cmd('wincmd ' .. direction)
  if curwin == vim.api.nvim_get_current_win() then
    vim.fn.system('tmux select-pane ' .. tmux_cmd)
  end
end

vim.keymap.set('n', '<C-h>', function() smart_move('h', '-L') end, { silent = true })
vim.keymap.set('n', '<C-j>', function() smart_move('j', '-D') end, { silent = true })
vim.keymap.set('n', '<C-k>', function() smart_move('k', '-U') end, { silent = true })
vim.keymap.set('n', '<C-l>', function() smart_move('l', '-R') end, { silent = true})


-- normal mode
wk.add({
  { '<c-LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', desc = 'go to definition' },
  { '<c-q>', '<cmd>q<cr>', desc = 'close buffer' },
  { '<esc>', '<cmd>noh<cr>', desc = 'remove search highlight' },
  { '[q', ':silent cprev<cr>', desc = '[q]uickfix prev' },
  { ']q', ':silent cnext<cr>', desc = '[q]uickfix next' },
  { 'gN', 'Nzzzv', desc = 'center search' },
  { 'gf', ':e <cfile><CR>', desc = 'edit file' },
  { 'gl', '<c-]>', desc = 'open help link' },
  { 'n', 'nzzzv', desc = 'center search' },
  { 'z?', ':setlocal spell!<cr>', desc = 'toggle [z]pellcheck' },
  { 'zl', ':Telescope spell_suggest<cr>', desc = '[l]ist spelling suggestions' },
}, { mode = 'n', silent = true })

-- visual mode
wk.add {
  {
    mode = { 'v' },
    { '.', ':norm .<cr>', desc = 'repat last normal mode command' },
    { '<M-j>', ":m'>+<cr>`<my`>mzgv`yo`z", desc = 'move line down' },
    { '<M-k>', ":m'<-2<cr>`>my`<mzgv`yo`z", desc = 'move line up' },
    { 'q', ':norm @q<cr>', desc = 'repat q macro' },
  },
}

--harpoon
harpoon = require('harpoon')
harpoon:setup()

wk.add({
  {
    {"<leader>a", function() harpoon:list():add() end, desc='Add Mark'},
    {"<c-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc='Search Marks'},
    {"<leader>s", function() harpoon:list():select(1) end, desc='M1'},
    {"<leader>d", function() harpoon:list():select(2) end, desc='M2'},
    {"<leader>S", function() harpoon:list():select(3) end, desc='M3'},
    {"<leader>D", function() harpoon:list():select(4) end, desc='M3'},
    { '<leader>e', group = '[e]dit' },
    { '<leader>f', group = '[f]ind (telescope)' },
    { '<leader>f<space>', '<cmd>Telescope buffers<cr>', desc = '[ ] buffers' },
    { '<leader>t', group='[R]epl'},
    { '<leader>fM', '<cmd>Telescope man_pages<cr>', desc = '[M]an pages' },
    { '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = '[b]uffer fuzzy find' },
    { '<leader>fc', '<cmd>Telescope git_commits<cr>', desc = 'git [c]ommits' },
    { '<leader>fd', '<cmd>Telescope buffers<cr>', desc = '[d] buffers' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '[f]iles' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = '[g]rep' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '[h]elp' },
    { '<leader>fj', '<cmd>Telescope jumplist<cr>', desc = '[j]umplist' },
    { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = '[k]eymaps' },
    { '<leader>fl', '<cmd>Telescope loclist<cr>', desc = '[l]oclist' },
    { '<leader>fm', '<cmd>Telescope marks<cr>', desc = '[m]arks' },
    { '<leader>fq', '<cmd>Telescope quickfix<cr>', desc = '[q]uickfix' },
    { '<leader>g', group = '[g]it' },
    { '<leader>gb', group = '[b]lame' },
    { '<leader>gbb', ':GitBlameToggle<cr>', desc = '[b]lame toggle virtual text' },
    { '<leader>gbc', ':GitBlameCopyCommitURL<cr>', desc = '[c]opy' },
    { '<leader>gbo', ':GitBlameOpenCommitURL<cr>', desc = '[o]pen' },
    { '<leader>gc', ':GitConflictRefresh<cr>', desc = '[c]onflict' },
    { '<leader>gd', group = '[d]iff' },
    { '<leader>gdc', ':DiffviewClose<cr>', desc = '[c]lose' },
    { '<leader>gdo', ':DiffviewOpen<cr>', desc = '[o]pen' },
    { '<leader>gs', ':Gitsigns<cr>', desc = 'git [s]igns' },
    {
      '<leader>gwc',
      ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      desc = 'worktree create',
    },
    {
      '<leader>gws',
      ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
      desc = 'worktree switch',
    },
    { '<leader>i', group = '[i]mage' },
    { '<leader>l', group = '[l]anguage/lsp' },
    {
      '<leader>ldd',
      function()
        vim.diagnostic.enable(false)
      end,
      desc = '[d]isable',
    },
    { '<leader>lde', vim.diagnostic.enable, desc = '[e]nable' },
    { '<leader>le', vim.diagnostic.open_float, desc = 'diagnostics (show hover [e]rror)' },
    { '<leader>o', group = '[o]tter & c[o]de' },
    { '<leader>oa', require('otter').activate, desc = 'otter [a]ctivate' },
    { '<leader>oc', 'O# %%<cr>', desc = 'magic [c]omment code chunk # %%' },
    { '<leader>od', require('otter').activate, desc = 'otter [d]eactivate' },
    { '<leader>ob', ':ObsidianBacklinks<cr>', desc = 'obsidian [b]acklinks'},

  },
}, { mode = 'n' })
