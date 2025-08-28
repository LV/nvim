return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    enabled = false,  -- press keybinding once to enable instead of twice (due to toggle)
    scope = { enabled = false },
  },
  keys = {
    { "<leader>mi", function()
      -- Toggle IBL
      vim.cmd("IBLToggle")
      -- Also toggle whitespace display with periods
      if vim.opt.list:get() then
        vim.opt.list = false
      else
        vim.opt.list = true
        vim.opt.listchars = { tab = "→ ", space = "·", trail = "~", extends = ">", precedes = "<" }
      end
    end, desc = "Toggle Indentation Guide & Whitespace" }
  },
  lazy = true,
}
