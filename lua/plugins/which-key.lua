require("config/vault")
require("util/which-key")

-- HELPER FUNCTIONS
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
      { "<leader>cl", group = "LSP" },
      { "<leader>cli", "<cmd>LspInfo<CR>", desc = "Info" },
      { "<leader>clm", "<cmd>Mason<CR>", desc = "Menu" },
      { "<leader>cN",  function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
      { "<leader>cn",  function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },

      { "<leader>f", group = "file" },
      { "<leader>fc", group = "config" },
      { "<leader>fcv",
        function()
          require("oil").open("~/.config/nvim")
        end,
        desc = "Open Neovim Config" },
      { "<leader>fcx",
        function()
          require("oil").open("~/nixos")
        end,
        desc = "Open Nixos Config" },
      { "<leader>fd",  function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Search TODO" },
      { "<leader>fv",
        function()
          require("oil").open(VaultPath)
        end,
        desc = "Open Vault" },

      { "<leader>g", group = "git" },
      { "<leader>gB",  function() Snacks.gitbrowse() end, desc = "Git Browse" },
      { "<leader>gb", group = "blame" },
      { "<leader>gbb", "<cmd>Git blame<CR>", desc = "Blame" },
      { "<leader>gbl", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>gd", "<cmd>Git diff<CR>", desc = "Diff" },
      { "<leader>gg",  function() lazygit_repo_from_cwd() end, desc = "LazyGit" },
      { "<leader>gl",  function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },

      { "<leader>n", group = "notifications" },
      { "<leader>nd",  function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>nh",  function() Snacks.notifier.show_history() end, desc = "Notification History" },

      { "<leader>o", group = "org" },
      { "<leader>oa", "<cmd>Org agenda<CR>", desc = "agenda"},
      { "<leader>od", group = "daily" },
      { "<leader>odd", "<cmd>ObsidianDailies<CR>", desc = "See Recent Dailies" },
          -- `<cmd>ObsidianDailies -2 1<CR>` Shows Dailies from 2 days ago until tomorrow
      { "<leader>odt", "<cmd>ObsidianToday<CR>", desc = "Open Today's Document" },
      { "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find File in Vault" },
      { "<leader>og", "<cmd>ObsidianSearch<CR>", desc = "Ripgrep Vault" },
      { "<leader>on", group = "note" },
      { "<leader>ona", CreateAtomicNote, desc = "New Atomic Note" },
      { "<leader>onf", CreateFleetingNote, desc = "New Fleeting Note" },
      { "<leader>onn", CreateNote, desc = "New Note" },

      { "<leader>P", "<cmd>Lazy<CR>", desc = "Open NVim Packages (LazyVim)" },
      { "<leader>p", "<cmd>Lazy<CR>", desc = "Open NVim Packages (LazyVim)" },

      { "<leader>r", group = "runner" },

      { "<leader>s",   function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },

      { "<leader>t",   function() Snacks.terminal() end, desc = "Toggle Terminal" },

      { "<leader>w", group = "window" },
      { "<leader>ws", "<cmd>split<CR>", desc = "Split Window Horizontally" },
      { "<leader>wv", "<cmd>vsplit<CR>", desc = "Split Window Vertically" },
    },
  },
}

