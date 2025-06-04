local config = function()
  require("orgmode").setup({
    org_agenda_files = "~/v/agenda",
    org_default_notes_file = "~/v/refile.org",
    org_startup_folded = "showeverything",
  })

  -- Only apply Org-specific highlight overrides for Bluloco
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
      if vim.g.colors_name == "bluloco-dark" or vim.g.colors_name == "bluloco" then
        local bluloco_colors = {
          title      = "#10b1fe",  -- Blue
          constant   = "#ff78f8",  -- Magenta
          identifier = "#3fc56b",  -- Green
          statement  = "#58c6ff",  -- Light blue-ish
          preproc    = "#ff936a",  -- Orange
          type       = "#f9c859",  -- Yellow
          special    = "#9f7efe",  -- Violet
          string     = "#ce9887",  -- Brown
        }

        vim.api.nvim_set_hl(0, 'Title',     { fg = bluloco_colors.title,     bold = true })
        vim.api.nvim_set_hl(0, 'Constant',  { fg = bluloco_colors.constant,  bold = true })
        vim.api.nvim_set_hl(0, 'Identifier',{ fg = bluloco_colors.identifier,bold = true })
        vim.api.nvim_set_hl(0, 'Statement', { fg = bluloco_colors.statement, bold = true })
        vim.api.nvim_set_hl(0, 'PreProc',   { fg = bluloco_colors.preproc,   bold = true })
        vim.api.nvim_set_hl(0, 'Type',      { fg = bluloco_colors.type,      bold = true })
        vim.api.nvim_set_hl(0, 'Special',   { fg = bluloco_colors.special,   bold = true })
        vim.api.nvim_set_hl(0, 'String',    { fg = bluloco_colors.string,    bold = true })
      end
    end,
  })
end


return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = config,
}
