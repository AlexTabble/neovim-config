-- Insert code chunk keybindings
vim.keymap.set("n", "<leader>qir", "<Esc>O```{r}<Esc>o```<Esc>O", { desc = "[I]nsert [R] chunk" })
vim.keymap.set("n", "<leader>qip", "<Esc>O```{python}<Esc>o```<Esc>O", { desc = "[I]nsert [P]ython chunk" })
vim.keymap.set("n", "<leader>qij", "<Esc>O```{julia}<Esc>o```<Esc>O", { desc = "[I]nsert [J]ulia chunk" })
vim.keymap.set("n", "<leader>qic", "<Esc>O```<Esc>o```<Esc>O", { desc = "[I]nsert [C]ode chunk" })

require("otter").activate()

-- Features from jmbuhr's Quarto plugin:
require("quarto").activate()
vim.keymap.set("n", "<leader>pQ", "<cmd>QuartoPreview<cr>", { desc = "[P]review" })
vim.keymap.set("n", "<leader>qR", "<cmd>QuartoRender<cr>", { desc = "[R]ender" })
-- Set the plugin/keymaps up to provide slime with code to run
local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>qrc", runner.run_cell, { desc = "[r]un [c]ell", silent = true })
vim.keymap.set("n", "<localleader>qra", runner.run_above, { desc = "[r]un cell and [a]bove", silent = true })
vim.keymap.set("n", "<localleader>qrb", runner.run_below, { desc = "[r]un cell and [b]elow", silent = true })
vim.keymap.set("n", "<localleader>qrA", runner.run_all, { desc = "[r]un [A]ll cells", silent = true })
vim.keymap.set("n", "<localleader>qrl", runner.run_line, { desc = "[r]un [l]ine", silent = true })
vim.keymap.set("v", "<localleader>qrr", runner.run_range, { desc = "run visual [r]ange", silent = true })
vim.keymap.set("n", "<localleader>qRA", function()
	runner.run_all(true)
end, { desc = "[R]un [A]ll cells of all languages", silent = true })
