-- lua/config/globals.lua
-- Global variables and early runtime options

-- Leader keys (must be set before `Lazy.nvim` loads)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Global editor options
vim.o.conceallevel=1
vim.opt.clipboard = "unnamedplus"
