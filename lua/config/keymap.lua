local wk = require 'which-key'
local handlers = require 'misc.handlers'

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

-- go back on link : obsidian
nmap('gb', ':Obsidian backlinks<cr>')

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
harpoon = require 'harpoon'
harpoon:setup()

wk.add({
  {
    {
      '<leader>a',
      function()
        harpoon:list():add()
      end,
      desc = 'Add Mark',
    },
    {
      '<c-e>',
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Search Marks',
    },
    {
      '<M-h>',
      function()
        harpoon:list():select(1)
      end,
      desc = 'M1',
    },
    {
      '<M-j>',
      function()
        harpoon:list():select(2)
      end,
      desc = 'M2',
    },
    {
      '<M-k>',
      function()
        harpoon:list():select(3)
      end,
      desc = 'M3',
    },
    {
      '<M-l>',
      function()
        harpoon:list():select(4)
      end,
      desc = 'M3',
    },
    { '<leader>e', group = '[e]dit' },
    { '<leader>f', group = '[f]ind (telescope)' },
    { '<leader>f<space>', '<cmd>Telescope buffers<cr>', desc = '[ ] buffers' },
    { '<leader>t', group = '[R]epl' },
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
    { '<leader>lrr', vim.lsp.buf.rename, desc = 'rename' },
    { '<leader>o', group = '[o]tter & c[o]de' },
    { '<leader>oa', require('otter').activate, desc = 'otter [a]ctivate' },
    { '<leader>oc', 'O# %%<cr>', desc = 'magic [c]omment code chunk # %%' },
    { '<leader>od', require('otter').activate, desc = 'otter [d]eactivate' },
    { '<leader>ob', ':Obsidian backlinks<cr>', desc = 'obsidian [b]acklinks' },
    {
      '<leader>oh',
      function()
        vim.cmd.edit(vim.fn.fnameescape(vim.fn.getcwd() .. '/Nvim_Navigation.md'))
      end,
      desc = 'Go Home',
    },
    {
      '<leader>ol',
      function()
        handlers.search_and_link()
      end,
      desc = 'Grep for link',
    },
    { '<leader>z', group = '[z]otero' },
  },
}, { mode = 'n' })
