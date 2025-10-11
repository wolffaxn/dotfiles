-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- file encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- indentation
vim.opt.autoindent = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.smarttab = true
vim.opt.softtabstop = 2

-- enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.splitkeep = "cursor"

-- sync clipboard netween os and neovim
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- turn off swapfile
vim.opt.swapfile = false
