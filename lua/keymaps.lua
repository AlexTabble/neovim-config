local builtin = require("telescope.builtin")
local harpoon = require("harpoon")

-- Normal Keymaps --
-- Better functionality for general keymaps --
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

--Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>x", "<CMD>q<CR>")

-- New Windows
map("n", "|", "<CMD>vsplit<CR>")
map("n", "-", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Better scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- File Navigation
vim.keymap.set("n", "<leader>nn", function()
	vim.cmd("NeovimProjectLoad ~/.config/nvim")
end, { desc = "Open nvim config" })

vim.keymap.set("n", "<leader>nc", function()
	vim.cmd("edit ~/.config")
end, { desc = "Edit .config" })

vim.keymap.set("n", "<leader>no", function()
	vim.cmd("NeovimProjectLoad ~/Documents/ObVault")
end)

vim.keymap.set("n", "<leader>nh", function()
	vim.cmd("edit ~/")
	vim.cmd("Alpha")
end, { desc = "Go Home" })

vim.keymap.set("n", "<leader>np", function()
	vim.cmd("NeovimProjectDiscover")
end, { desc = "Pick Project" })

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
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Telescope fuzzy find" })

-- Harpoon Keymaps --
harpoon:setup()

vim.keymap.set("n", "<leader>ma", function()
	harpoon:list():add()
end, { desc = "Add mark" })
vim.keymap.set("n", "<leader>mo", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open mark List" })

vim.keymap.set("n", "<leader>m1", function()
	harpoon:list():select(1)
end, { desc = "Select Harpoon 1" })
vim.keymap.set("n", "<leader>m2", function()
	harpoon:list():select(2)
end, { desc = "Select Harpoon 2" })
vim.keymap.set("n", "<leader>m3", function()
	harpoon:list():select(3)
end, { desc = "Select Harpoon 3" })
vim.keymap.set("n", "<leader>m4", function()
	harpoon:list():select(4)
end, { desc = "Select Harpoon 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>mp", function()
	harpoon:list():prev()
end, { desc = "Previous Mark" })
vim.keymap.set("n", "<leader>mf", function()
	harpoon:list():next()
end, { desc = "Next Mark" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Toggle Oil" })

-- Git
vim.keymap.set("n", "<leader>g", function()
	vim.cmd("Neogit")
end, { desc = "Git" })

-- Autocommands --
-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = vim.env.MYVIMRC or vim.fn.expand("~/.config/nvim/init.lua"),
	callback = function()
		vim.cmd("silent! source %")
		vim.notify("Nvim config reloaded!", vim.log.levels.INFO)
	end,
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
			on_visual = true,
		})
	end,
})

-- Add Lsp Keybindings
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP keymaps and capabilities",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		-- Enable completion triggered by <c-x><c-o>
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Key mappings
		local opts = { buffer = bufnr, silent = true }

		-- Hover
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- Goto
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

		-- References
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- Code actions
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Rename
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- Formatting
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		-- Show capabilities in hover
		if client and client.server_capabilities then
			local caps = client.server_capabilities
			vim.keymap.set("n", "<leader>lc", function()
				print(vim.inspect(caps))
			end, opts)
		end
	end,
})

-- Show All Keymaps
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = true })
end, { desc = "Show All" })
