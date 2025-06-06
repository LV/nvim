---@return nil
local diff = function()
  require("mini.diff").setup({
    view = {
      style = "sign",
    },
  })
end

---@return nil
local icons = function()
  require("mini.icons").setup({
    style = "glyph",
  })
end

---@return nil
local indentscope = function()
  require("mini.indentscope").setup({
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(),
    },
    symbol = "│",
  })
end

---@return nil
local jump = function()
  require("mini.jump").setup()
end

---@return nil
local jump2d = function()
  require("mini.jump2d").setup({
    labels = "etovxqpdygfblzhckisuran",
    mappings = {
      start_jumping = "", -- remove default binding
    },
  })
end

---@return nil
local starter = function()
  require("mini.starter").setup({
    evaluate_single = true,

    items = {
      { name = "Explorer", action = "Oil", section = "Actions" },
      { name = "Find", action = "Telescope find_files", section = "Actions" },
      { name = "Grep", action = "Telescope live_grep", section = "Actions" },
      { name = "New",  action = "enew", section = "Actions" },
      { name = "Quit", action = "q", section = "Actions" },
    },

    header = "",
    footer = "",
  })

  -- Add an autocommand to check mappings in starter buffer
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "starter",
    callback = function()
      -- Print all 'g' mappings in the buffer
      vim.cmd("verbose map g")

      -- Force immediate recognition of 'g' key
      vim.keymap.set('n', 'g', 'g', { buffer = true, nowait = true })
    end
  })

  if vim.fn.argc() == 0 then
    vim.cmd("enew")
    require("mini.starter").open()
  end
end

---@return nil
local statusline = function()
  require("mini.statusline").setup()
end

---@type LazyPluginSpec
return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    diff()
    icons()
    indentscope()
    jump()
    jump2d()
    starter()
    statusline()
  end,
}
