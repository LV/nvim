-- lua/config/options.lua
-- Default Neovim options
-- May be overridden in filetype-specific or plugin-specific contexts

-- Indentation
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = true

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Behavior
vim.opt.encoding = "UTF-8"

-- Remove trailing whitespace and newlines on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])  -- remove trailing whitespace
    vim.cmd([[%s/\($\n\s*\)\+\%$//e]])  -- remove trailing newlines
    vim.fn.setpos(".", save_cursor)
  end,
})
