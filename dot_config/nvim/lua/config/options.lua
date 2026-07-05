-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- file encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- clipboard
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- colors
vim.opt.termguicolors = true
vim.g.syntax = "enable"
vim.o.winblend = 0

-- default position
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.conceallevel = 0

-- indent
vim.opt.autoindent = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.smarttab = true
vim.opt.softtabstop = 2

vim.opt.splitkeep = "cursor"

-- wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
