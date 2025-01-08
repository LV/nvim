local icons = function()
  require("mini.icons").setup({
    style = "glyph",
  })
end

local indentscope = function()
  require("mini.indentscope").setup({
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(),
    },
    symbol = "│",
  })
end

local jump = function()
  require("mini.jump").setup()
end

local statusline = function()
  require("mini.statusline").setup()
end

return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    icons()
    indentscope()
    jump()
    statusline()
  end,

}
