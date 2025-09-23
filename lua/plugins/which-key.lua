require("config.vars")

-- HELPER FUNCTIONS
---@return nil
local lazygit_repo_from_cwd = function()
  -- When opening lazygit, open repo in the directory of the current buffer.
  -- Rather than opening repo from directory where `nvim` was first invoked.
  local cwd
  if vim.bo.filetype == "oil" then
    local oil = require("oil")
    cwd = oil.get_current_dir()
  else
    cwd = vim.fn.expand("%:p:h")
  end

  if cwd and vim.fn.isdirectory(cwd) == 1 then
    -- Change directory to `cwd` before invoking Snacks.lazygit
    vim.cmd("cd " .. cwd)
    Snacks.lazygit()
  else
    vim.notify("Invalid directory for lazygit", vim.log.levels.ERROR)
  end
end


---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.nvim" },
  event = "VeryLazy",
  opts = {
    spec = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },

      { ".", "<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>", desc = "Hop to Char" },

      { "<leader>c", group = "code" },
      { "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Diagnose" },
      { "<leader>cD", "<cmd>Telescope diagnostics<CR>", desc = "All Diagnostics" },
      { "<leader>cl", group = "LSP" },
      { "<leader>cli", "<cmd>LspInfo<CR>", desc = "Info" },
      { "<leader>clm", "<cmd>Mason<CR>", desc = "Menu" },
      { "<leader>cN", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
      { "<leader>cn", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },

      { "<leader>f", group = "file" },
      { "<leader>fc", group = "config" },
      { "<leader>fcv", function() require("oil").open("~/.config/nvim") end, desc = "Open Neovim Config" },
      { "<leader>fcx", function() require("oil").open("~/nixos") end, desc = "Open NixOS Config" },
      { "<leader>fd", "<cmd>lua MiniDiff.toggle_overlay()<CR>", desc = "Show Diffs" },
      { "<leader>fe", "<cmd>Oil<CR>", desc = "File Explorer" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Fuzzy Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Ripgrep" },
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Search TODO" },
      { "<leader>fv", function() require("oil").open(VaultPath) end, desc = "Open Vault" },

      { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "Go to function definition" },

      { "<leader>g", group = "git" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>gg", function() lazygit_repo_from_cwd() end, desc = "LazyGit" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Open in Browser" },

      { "<leader>m", group = "misc" },
      -- <leader>mi  -- toggle mini.indentscope

      { "<leader>n", group = "notifications" },
      { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification History" },

      { "<leader>P", "<cmd>Lazy<CR>", desc = "Open NVim Packages (LazyVim)" },
      { "<leader>p", "<cmd>Lazy<CR>", desc = "Open NVim Packages (LazyVim)" },

      { "<leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },

      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },

      { "<leader>v", group = "vault" },
      { "<leader>vd", function() vim.cmd(string.format("tabedit %s/daily/%s.txt", VaultPath, os.date("%Y-%m-%d"))) end, desc = "Open daily note" },
      { "<leader>vv", function() Snacks.scratch({file = TxtPath, ft = "text", icon = "λ", name = TxtFilename}) end, desc = "Open lv.txt" },

      { "<leader>w", group = "window" },
      { "<leader>wh", "<cmd>wincmd h<CR>", desc = "Navigate Left" },
      { "<leader>wj", "<cmd>wincmd j<CR>", desc = "Navigate Down" },
      { "<leader>wk", "<cmd>wincmd k<CR>", desc = "Navigate Up" },
      { "<leader>wl", "<cmd>wincmd l<CR>", desc = "Navigate Right" },
      { "<leader>ws", "<cmd>split<CR>", desc = "Split Window Horizontally" },
      { "<leader>wt", "<cmd>tabnew<CR>", desc = "New Tab" },
      { "<leader>wv", "<cmd>vsplit<CR>", desc = "Split Window Vertically" },
    },
  },
}

