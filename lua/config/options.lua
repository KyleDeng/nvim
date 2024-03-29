-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.wrap = true -- Disable line wrap
opt.smartindent = true

-- Enable LazyVim auto format
vim.g.autoformat = false

--Doxygen
vim.g.DoxygenToolkit_commentType = "C"
vim.g.doxygen_enhanced_color = 1
vim.g.DoxygenToolkit_briefTag_funcName = "yes"
vim.g.DoxygenToolkit_authorName = "huatuo"
vim.g.DoxygenToolkit_versionString = "1.0.0"
