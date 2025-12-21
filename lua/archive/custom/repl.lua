local M = {}

M.repl_pane = nil

local function repl_cmd()
  if vim.bo.filetype == "python" or vim.bo.filetype == "quarto" then
    return "ipython"
  elseif vim.bo.filetype == "r" then
    return "R"
  else
    return "$SHELL"
  end
end

function M.open_repl()
  if M.repl_pane then
    vim.notify("REPL already running", vim.log.levels.INFO)
    return
  end

  -- Capture pane id of the newly created pane
  local pane = vim.fn.system({
    "tmux",
    "split-window",
    "-h",
    "-P",
    "-F",
    "#{pane_id}",
    repl_cmd(),
  })

  M.repl_pane = pane:gsub("%s+", "")

  vim.g.slime_default_config = {
    target_pane = M.repl_pane,
  }

  vim.notify("REPL started in pane " .. M.repl_pane)
end

function M.close_repl()
  if not M.repl_pane then
    vim.notify("No REPL to close", vim.log.levels.WARN)
    return
  end

  vim.fn.system({ "tmux", "kill-pane", "-t", M.repl_pane })
  M.repl_pane = nil
  vim.notify("REPL closed")
end

function M.restart_repl()
  M.close_repl()
  vim.defer_fn(M.open_repl, 100)
end

return M
