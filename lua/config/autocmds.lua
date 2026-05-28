-- Auto-show diagnostic float on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "if_many",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- Disable single quote auto-pairing for Rust (lifetimes)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = vim.api.nvim_create_augroup("rust_disable_single_quote", { clear = true }),
  callback = function()
    vim.keymap.set("i", "'", "'", { buffer = 0 })
  end,
  desc = "Disable single quote pairing in Rust for lifetimes",
})

-- Disable auto-commenting on new lines for all file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable auto-comment on new line",
})
