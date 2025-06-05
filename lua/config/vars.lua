-- lua/config/vars.lua
-- Define global variable values at startup


--- Utility function for getting system hostname
---@return string|nil hostname
local function get_hostname()
  local handle = io.popen("hostname") -- Execute hostname command
  if handle then
    local hostname = handle:read("*a"):gsub("\n", "") -- Strip newline
    handle:close()
    return hostname
  else
    return nil
  end
end

---@type string|nil
local hostname = get_hostname()

if hostname == "FY1V4T0VFJ" then  -- Work environment
  VaultPath = "~/bbvault"
  TxtFilename = "bb.txt"
  TxtPath = "/Users/lvictoria7/" .. TxtFilename .. "/" .. TxtFilename
else  -- Default personal environment
  VaultPath = "~/v"
  TxtFilename = "lv.txt"
  TxtPath = "~/v/" .. TxtFilename
end
