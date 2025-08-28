return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = { enabled = false },  -- press keybinding once to enable instead of twice (due to toggle)
  keys = { { "<leader>mi", "<cmd>IBLToggle<CR>", desc = "Toggle Indentation Guide" } },
  lazy = true,
}
