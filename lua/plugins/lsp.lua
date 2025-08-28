return {
  ---@type LazyPluginSpec
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  ---@type LazyPluginSpec
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  ---@type LazyPluginSpec
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Completion plugins
      { "windwp/nvim-autopairs", event = "InsertEnter" },
      { "hrsh7th/nvim-cmp", event = "InsertEnter" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    },
    -- We don't need a config function here because the config
    -- is already handled in `mason-lspconfig`
  },
}
