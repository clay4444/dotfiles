return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- :h mason-default-settings
    -- ~/.local/share/nvim/mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "lua_ls",
      },
    })

  end,
}
