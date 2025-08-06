-- Insert code chunk keybindings
vim.keymap.set("n", "<leader>qir", "<Esc>O```{r}<Esc>o```<Esc>O", { desc = "[I]nsert [R] chunk" })
vim.keymap.set("n", "<leader>qip", "<Esc>O```{python}<Esc>o```<Esc>O", { desc = "[I]nsert [P]ython chunk" })
vim.keymap.set("n", "<leader>qij", "<Esc>O```{julia}<Esc>o```<Esc>O", { desc = "[I]nsert [J]ulia chunk" })
vim.keymap.set("n", "<leader>qic", "<Esc>O```<Esc>o```<Esc>O", { desc = "[I]nsert [C]ode chunk" })

require("otter").activate()
require("quarto").activate()

-- Preview stuff
vim.keymap.set("n", "<leader>pQ", "<cmd>QuartoPreview<cr>", { desc = "[P]review" })
vim.keymap.set("n", "<leader>qR", "<cmd>QuartoRender<cr>", { desc = "[R]ender" })

-- Syncs current repl instance which avoids using quarto.runner
local keeper = require("otter.keeper")

vim.keymap.set("n", "<localleader>tb", function()
	lines = keeper.get_language_lines_around_cursor()
	require("iron.core").send(nil, lines)
end)
