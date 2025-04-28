-- lua/config/options.lua
--
-- Default Neovim options.
-- Some of these are overwritten depending on context


local opt = vim.opt

-- Indentation
opt.tabstop = 4
opt.smartindent = true
opt.wrap = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- Behavior
opt.encoding = "UTF-8"

