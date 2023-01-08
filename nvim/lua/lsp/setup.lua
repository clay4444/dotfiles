local status, mason = pcall(require, "mason")
if not status then
  vim.notify("mason not found!")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("mason-lspconfig not found!")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("lspconfig not found!")
  return
end

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
mason_config.setup({
  ensure_installed = {
    "clangd",
    "sumneko_lua",
  },
})

-- Install list.
-- { key: Server name， value: Configuration file }
-- The key must in the list that below url supported.
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  clangd = require("lsp.config.clangd"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- So, the customer initial configuration must implements the `on_setup` method! 
    config.on_setup(lspconfig[name])
  else
    -- Default argument is {}.
    lspconfig[name].setup({})
  end
end

require("lsp.ui")
