local config = function()
  require("orgmode").setup({
    org_agenda_files = "~/v/agenda",
    org_default_notes_file = "~/v/refile.org",
    org_startup_folded = "showeverything",
  })
end

return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = config,
}
