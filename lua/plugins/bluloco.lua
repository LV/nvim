-- lua/plugins/bluloco.lua
-- Main colorscheme


---@return nil
local config = function()
  vim.cmd("colorscheme bluloco")
end

---@type LazyPluginSpec
return {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = config,
}
