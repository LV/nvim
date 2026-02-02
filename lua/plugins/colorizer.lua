---@type fun()
local config = function()
  require("colorizer").setup()
end

---@type LazyPluginSpec
return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  config = config,
}
