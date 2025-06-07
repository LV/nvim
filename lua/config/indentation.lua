-- lua/config/indentation.lua
-- Filetype-specific indentation settings

-- Indentation profiles
--- `shiftwidth` must be equal to `tabstop` for visual consistency
---@class IndentationOptions
---@field expandtab boolean # Use spaces if true, tabs if false
---@field shiftwidth integer # Number of spaces per indentation level
---@field tabstop integer # Number of spaces a <Tab> counts for

---@type table<string, IndentationOptions>
local indentation_profiles = {
  c          = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  cmake      = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  cpp        = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  cs         = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  dockerfile = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  go         = { expandtab = false, shiftwidth = 4, tabstop = 4 },
  html       = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
  json       = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
  lua        = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
  make       = { expandtab = false, shiftwidth = 4, tabstop = 4 },
  markdown   = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  nix        = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
  org        = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
  sql        = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  text       = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
  toml       = { expandtab = true,  shiftwidth = 4, tabstop = 4 },
  typst      = { expandtab = true,  shiftwidth = 2, tabstop = 2 },
}

--- Set filetype-specific indentation settings using autocmds.
--- Creates a `FileType` autocmd for each filetype listed in the input table.
---@param filetype_opts table<string, IndentationOptions>
---@return nil
local function set_indentation_settings(filetype_opts)
  local group = vim.api.nvim_create_augroup("IndentationSettings", { clear = true })
  for filetype, opts in pairs(filetype_opts) do
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = filetype,
      command = string.format("setlocal %s shiftwidth=%d tabstop=%d", opts.expandtab and "expandtab" or "noexpandtab", opts.shiftwidth, opts.tabstop),
    })
  end
end

set_indentation_settings(indentation_profiles)
