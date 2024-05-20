-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- file encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- indentation
opt.autoindent = true
opt.backspace = { "start", "eol", "indent" }
opt.smarttab = true
opt.softtabstop = 2
