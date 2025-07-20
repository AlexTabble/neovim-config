local builtin = require("telescope.builtin")

-- Normal Keymaps --
-- Better functionality for general keymaps --
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

--Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Write Quit --
-- map("n", "<leader>wq", "<CMD> update q<CR>")

-- Exit Insert Mode
map("i", "jk", "<ESC>")

-- New Windows
map("n", "|", "<CMD>vsplit<CR>")
map("n", "-", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Open Terminal

-- File Navigation
vim.keymap.set("n", "<leader>nn", function()
    vim.cmd("edit ~/.config/nvim")
end, { desc = "Open nvim config" })

vim.keymap.set("n", "<leader>nc", function()
    vim.cmd("edit ~/.config")
end, { desc = "Edit .config" })

vim.keymap.set("n", "<leader>no", function()
    vim.cmd("edit ~/Documents/ObVault")
end)

vim.keymap.set("n", "<leader>nh", function()
    vim.cmd("edit ~/")
    vim.cmd("Alpha")
end)

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Telescope Keymaps --
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- NeoTree Keymaps --
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Neotree toggle filesystem left")
end, { desc = "Toggle Neo-tree" })

local M = {}

-- DAP keymaps -- Not used at the moment
function M.dap(dap)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<F5>", dap.continue, opts)
    map("n", "<F10>", dap.step_over, opts)
    map("n", "<F11>", dap.step_into, opts)
    map("n", "<F12>", dap.step_out, opts)
    map("n", "<Leader>b", dap.toggle_breakpoint, opts)
    map("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, opts)
    map("n", "<Leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, opts)
    map("n", "<Leader>dr", dap.repl.open, opts)
    map("n", "<Leader>dl", dap.run_last, opts)
end

return M
