---@return nil
local config = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "text",
    callback = function()
      vim.cmd([[setlocal ve=all]])
      vim.opt_local.wrap = false
      vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", { buffer = true, noremap = true })
      vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", { buffer = true, noremap = true })
      vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", { buffer = true, noremap = true })
      vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", { buffer = true, noremap = true })
      vim.keymap.set("v", "f", ":VBox<CR>", { buffer = true, noremap = true })
    end,
  })
end

--- @type LazyPluginSpec
return {
  "jbyuki/venn.nvim",
  ft = "text",   -- load only for text files
  cmd = "VBox",  -- also load if you use the VBox command
  config = config,
}
