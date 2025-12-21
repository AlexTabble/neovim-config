local M = {}

-- Send visual selection / block
function M.send_block()
  vim.cmd("SlimeSend")
end

-- Send whole file
function M.send_file()
  vim.cmd("%SlimeSend")
end

-- Send current line only (safe for REPL)
function M.send_line()
  local line = vim.api.nvim_get_current_line()
  if line == "" then
    return
  end
  vim.fn["slime#send"](line .. "\n")
end

return M
