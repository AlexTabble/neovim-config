vim.keymap.set("i", "mk", "$$<Left>", { buffer = true, desc = "Inline math" })

vim.keymap.set("i", "dm", "$$\n\n$$<Up>", { buffer = true, desc = "Display math block" })
