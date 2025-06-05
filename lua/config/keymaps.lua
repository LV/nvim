-- lua/config/keymaps.lua
-- Conditional terminal mappings for shell versus non-shell programs

-- Go to normal mode from terminal mode by pressing Escape
  -- Apply this only when in the shell
    -- i.e. do not overwrite keybindings when in terminal mode for other commands such as LazyGit
local function apply_shell_mappings()
  -- List of common shell programs
  local shells = { "bash", "zsh", "sh", "fish" }

  -- Get the terminal's command (buffer name)
  local term_cmd = vim.fn.expand("%:p:t")

  -- if the terminal buffer is running a shell, apply custom mappings
  if vim.tbl_contains(shells, term_cmd) then
    vim.api.nvim_set_keymap("t", "<Escape>", "<C-\\><C-n>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<Insert><Escape>", "<Escape>", { noremap = true, silent = true })
  else
    -- For non-shell terminal applications, revert to default escape behavior
    vim.api.nvim_set_keymap("t", "<Escape>", "<Escape>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<Insert><Escape>", "<Insert><Escape>", { noremap = true, silent = true })
  end
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = apply_shell_mappings
})
