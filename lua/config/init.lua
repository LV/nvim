-- bootstrap lazy.nvim (put this at the VERY top of init.lua)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- choose ONE of these two remotes, depending on what works on your network:
  -- local repo = "https://github.com/folke/lazy.nvim.git"  -- use this if HTTPS works
  local repo = "git@github.com:folke/lazy.nvim.git"  -- use this if ONLY SSH works
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load core configs (must not require plugins yet)
require("config.globals")
require("config.indentation")
require("config.options")

-- `Lazy.nvim` setup (force SSH for all plugin clones)
local opts = {
  defaults = { lazy = true },
  rtp = {
    disabled_plugins = {
      "gzip","matchit","matchparen","netrw","netrwPlugin",
      "tarPlugin","tohtml","tutor","zipPlugin",
    },
  },
  spec = { import = "plugins" },
  change_detection = { notify = false },

  -- 👇 this makes every plugin use SSH over 443
  git = {
    url_format = "git@github.com:%s.git",
    timeout = 300,
  },
}
require("lazy").setup(opts)
