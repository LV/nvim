-- lua/config/init.lua
-- Neovim core configuration loader and `Lazy.nvim` bootstrapper


-- Bootstrap `lazy.nvim`
---@type string
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)


-- Load core configurations before `Lazy.nvim`
require("config.globals")
require("config.indentation")
require("config.options")


-- `Lazy.nvim` setup
-- https://lazy.folke.io/configuration
-- TODO: Review whether to change `defaults` to `false` as suggested in docs
-- TODO: Review whether to remove `rtp`
-- TODO: Review whether to change notification for `change_detection`
-- TODO: Add type notation to `opts`
local opts = {
  defaults = { lazy = true },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    }
  },
  spec = {
    import = "plugins",
  },
  change_detection = { notify = false },
}

require("lazy").setup(opts)
