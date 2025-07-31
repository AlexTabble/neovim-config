return {
    "Vigemus/iron.nvim",
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
                        block_dividers = { "# %%", "#%%", "```{python", "```" },
                    },
                    r = {
                        command = { "R" },
                        format = common.bracketed_paste,
                        block_dividers = { "# %%", "#%%", "```{r", "```" },
                    },

                    quarto = {
                        command = function()
                            local bufnr = vim.api.nvim_get_current_buf()
                            local cursor = vim.api.nvim_win_get_cursor(0)[1] -- current line number (1-indexed)
                            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

                            local current_chunk_lang = "python" -- fallback default
                            for i = cursor - 1, 1, -1 do
                                local line = lines[i]
                                local r_chunk = line:match("^```%s*{r.*}")
                                local py_chunk = line:match("^```%s*{python.*}")
                                if r_chunk then
                                    current_chunk_lang = "r"
                                    break
                                elseif py_chunk then
                                    current_chunk_lang = "python"
                                    break
                                end
                            end

                            if current_chunk_lang == "r" then
                                return { "R" }
                            else
                                return { "ipython --no-autindent" }
                            end
                        end,

                        format = function(lines)
                            local filtered = {}
                            for _, line in ipairs(lines) do
                                if not line:match("^```") then
                                    table.insert(filtered, line)
                                end
                            end
                            return require("iron.fts.common").bracketed_paste(filtered)
                        end,

                        block_dividers = { "```{r}", "```{python}", "```" },
                    },
                },
                repl_filetype = function(_, ft)
                    if ft == "qmd" or ft == "quarto" then
                        -- Default to python unless R is detected
                        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                        for _, line in ipairs(lines) do
                            if line:match("^```{r") then
                                return "r"
                            end
                            if line:match("^```{python") then
                                return "python"
                            end
                        end
                        return "python"
                    end
                    return ft
                end,
                repl_open_cmd = {
                    view.split.vertical.rightbelow("%40"),
                },
            },
            keymaps = {
                toggle_repl = "<leader>tr",
                restart_repl = "<leader>tR",
                send_motion = "<leader>tc",
                visual_send = "<leader>tc",
                send_file = "<leader>tf",
                send_line = "<leader>tl",
                send_paragraph = "<leader>tp",
                send_until_cursor = "<leader>tu",
                send_mark = "<leader>tm",
                send_code_block = "<leader>tb",
                send_code_block_and_move = "<leader>tn",
                mark_motion = "<leader>tmc",
                mark_visual = "<leader>tmc",
                remove_mark = "<leader>tmd",
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

        -- Auto REPL on filetype - Breaks the REPL on creation of new file with no code yet, don't activate
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python", "r", "quarto", "qmd", "rmd", "ipynb" },
            callback = function()
                -- vim.cmd("IronRepl")
            end,
        })
    end,
}
