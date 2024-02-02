-- Extract config from a universal config.
local uConfig = require("common.uConfig")
local lsp = uConfig.lsp

local M = {}

M.keyAttach = function(bufnr)
  -- keybindings.
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
  end

  -- Rename.
  buf_set_keymap("n", lsp.rename, "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_set_keymap("n", lsp.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- Go xx.
  buf_set_keymap("n", lsp.definition, "<cmd>lua vim.lsp.buf.definition()<CR>")
  buf_set_keymap("n", lsp.hover, "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_set_keymap("n", lsp.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>")
  buf_set_keymap("n", lsp.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>")
  buf_set_keymap("n", lsp.references, "<cmd>lua vim.lsp.buf.references()<CR>")
  -- Diagnostic.
  buf_set_keymap("n", lsp.open_flow, "<cmd>lua vim.diagnostic.open_float()<CR>")
  buf_set_keymap("n", lsp.goto_prev, "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_set_keymap("n", lsp.goto_next, "<cmd>lua vim.diagnostic.goto_next()<CR>")
  -- Use external format plugin.
  -- buf_set_keymap("n", lsp.format, "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

-- Use specificied plugin to format file.
M.disableFormat = function(client)
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.flags = {
  debounce_text_changes = 150,
}

return M
