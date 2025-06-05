-- lua/config/keymaps.lua
-- Conditional terminal mappings for shell versus non-shell programs

--- Terminal escape keymap options
---@type vim.api.keymap.set.opts
local map_opts = { noremap = true, silent = true }

--- List of terminal programs considered to be interactive shells
---@type string[]
local shell_programs = { "bash", "fish", "sh", "zsh" }

--- Determine whether current terminal buffer is running a shell
---@return boolean
local function is_shell_terminal()
  -- Get name of terminal buffer's program (e.g. 'bash', 'lazygit')
  -- Uses Vim's filename modifiers:
  --   %  = current buffer name
  --  :p  = full path
  --  :t  = tail (last part of path)
  ---@type string
  local term_cmd = vim.fn.expand("%:p:t")
  return vim.tbl_contains(shell_programs, term_cmd)
end

--- Apply terminal-mode keymappings if buffer is a terminal
local function apply_shell_mappings()
  -- <Esc> exits to normal mode via <C-\><C-n>
  if is_shell_terminal() then
    vim.api.nvim_set_keymap("t", "<Escape>", "<C-\\><C-n>", map_opts)
    vim.api.nvim_set_keymap("t", "<Insert><Escape>", "<Escape>", map_opts)
  else
    -- Preserve <Esc> for full-screen terminal tools like LazyGit
    vim.api.nvim_set_keymap("t", "<Escape>", "<Escape>", map_opts)
    vim.api.nvim_set_keymap("t", "<Insert><Escape>", "<Insert><Escape>", map_opts)
  end
end

--- Autocommand: Apply terminal escape key mappings on terminal buffer open
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  desc = "Set <Esc> behavior in terminal buffers depending on shell/tool context",
  callback = apply_shell_mappings
})
