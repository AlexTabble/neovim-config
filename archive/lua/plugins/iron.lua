return {
	"Vigemus/iron.nvim",
	lazy = true,
	cmd = { "IronRepl" },
	keys = { "<localleader>tr" },
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")

		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					python = {
						command = { "ipython", "--no-autoindent" },
						format = common.bracketed_paste_python,
					},
					r = {
						command = { "R" },
					},
					quarto = {
						command = { "ipython", "--no-autoindent" },
						-- command = { "R" },
						block_dividers = {
							"```{python}",
							"```{r}",
							"```",
						},
						format = common.bracketed_paste,
					},
					markdown = {
						command = { "ipython", "--no-autoindent" },
						block_dividers = {
							"```python",
							"```r",
							"```",
						},
						send_code_block = common.markdown,
					},
				},
				repl_open_cmd = view.split.vertical.botright("40%"),
			},

			keymaps = {
				toggle_repl = "<leader>tr",
				restart_repl = "<leader>tR",
				-- send_motion = "<leader>tc",
				visual_send = "<leader>tc",
				send_file = "<leader>tf",
				send_line = "<leader>tl",
				send_paragraph = "<leader>tp",
				send_until_cursor = "<leader>tu",
				-- send_mark = "<leader>tm",
				-- send_code_block = "<leader>tb",
				-- send_code_block_and_move = "<leader>tn",
				-- mark_motion = "<leader>tmc",
				-- mark_visual = "<leader>tmc",
				-- remove_mark = "<leader>tmd",
				cr = "<leader>t<cr>",
				interrupt = "<leader>t<space>",
				exit = "<leader>tq",
				clear = "<leader>tcl",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})
	end,
}
