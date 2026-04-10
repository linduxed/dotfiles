local M = {}

function M.fold_text()
  local fs = vim.v.foldstart
  while vim.fn.getline(fs):match("^%s*$") do
    fs = vim.fn.nextnonblank(fs + 1)
  end

  local line
  if fs > vim.v.foldend then
    line = vim.fn.getline(vim.v.foldstart)
  else
    line = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(" ", vim.o.tabstop), "g")
  end

  local level_indent = string.rep("  ", math.max(0, vim.v.foldlevel - 1))
  local win_info = vim.fn.getwininfo(vim.fn.win_getid())[1] or {}
  local textoff = win_info.textoff or 0
  local w = vim.fn.winwidth(0) - textoff

  local fold_size = 1 + vim.v.foldend - vim.v.foldstart
  local fold_size_str = " " .. fold_size .. " lines "
  local line_count = vim.fn.line("$")
  local fold_percentage = string.format("[%.1f%%] ", (fold_size * 1.0) / math.max(1, line_count) * 100)
  local right_text = fold_size_str .. fold_percentage

  local left_text = level_indent .. line
  local left_max = math.max(0, w - vim.fn.strdisplaywidth(right_text) - 1)
  if vim.fn.strdisplaywidth(left_text) > left_max then
    local trunc_width = math.max(0, left_max - 3)
    left_text = vim.fn.strcharpart(left_text, 0, trunc_width) .. "..."
  end

  local expansion_string = string.rep(
    ".",
    math.max(1, w - vim.fn.strdisplaywidth(left_text) - vim.fn.strdisplaywidth(right_text))
  )

  return left_text .. expansion_string .. right_text
end

return M
