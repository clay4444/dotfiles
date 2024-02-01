return {
  "neovim/nvim-lspconfig",
  config = function()
    lspconfig = require("lspconfig")

    -- Install list.
    -- { key: Server name， value: Configuration file }
    -- The key must in the list that below url supported.
    -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
    local servers = {
      sumneko_lua = require("plugins.lsp.config.lua"), -- lua/lsp/config/lua.lua
      clangd = require("plugins.lsp.config.clangd"),
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

    require("plugins.lsp.ui")
  end,
}
