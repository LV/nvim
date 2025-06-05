-- https://nvim-orgmode.github.io/configuration
local config = function()
  require("orgmode").setup({
    org_adapt_indentation = false,
    org_agenda_files = "~/v/agenda",
    org_default_notes_file = "~/v/refile.org",
    org_startup_folded = "showeverything",
  })

  -- Only apply Org-specific highlight overrides for Bluloco
  -- https://nvim-orgmode.github.io/configuration#colors
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
      if vim.g.colors_name == "bluloco-dark" or vim.g.colors_name == "bluloco" then
        vim.api.nvim_set_hl(0, "@org.headline.level1", { fg = "#10b1fe", bold = true })  -- Blue
        vim.api.nvim_set_hl(0, "@org.headline.level2", { fg = "#ff78f8", bold = true })  -- Magenta
        vim.api.nvim_set_hl(0, "@org.headline.level3", { fg = "#3fc56b", bold = true })  -- Green
        vim.api.nvim_set_hl(0, "@org.headline.level4", { fg = "#58c6ff", bold = true })  -- Light Blue
        vim.api.nvim_set_hl(0, "@org.headline.level5", { fg = "#ff936a", bold = true })  -- Orange
        vim.api.nvim_set_hl(0, "@org.headline.level6", { fg = "#f9c859", bold = true })  -- Yellow
        vim.api.nvim_set_hl(0, "@org.headline.level7", { fg = "#9f7efe", bold = true })  -- Violet
        vim.api.nvim_set_hl(0, "@org.headline.level8", { fg = "#ce9887", bold = true })  -- Brown
      end
    end,
  })
end


---@type LazyPluginSpec
return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = config,
}
