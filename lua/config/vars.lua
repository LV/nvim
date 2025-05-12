-- lua/config/vars.lua
--
-- Assigns variable values upon launching Neovim.


-- Configuration options for variables
---@return string | nil
local function get_hostname()
  local handle = io.popen("hostname") -- Runs the hostname command
  if handle then
    local hostname = handle:read("*a"):gsub("\n", "") -- Removes the newline
    handle:close()
    return hostname
  else
    return nil
  end
end

local hostname = get_hostname()
if hostname == "FY1V4T0VFJ" then  -- Work environment
  VaultPath = "~/bbvault"
  TxtFilename = "bb.txt"
  TxtPath = "/Users/lvictoria7/" .. TxtFilename .. "/" .. TxtFilename
else  -- Default environment
  VaultPath = "~/v"
  TxtFilename = "lv.txt"
  TxtPath = "~/v/" .. TxtFilename
end
