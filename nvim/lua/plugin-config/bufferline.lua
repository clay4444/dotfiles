-- Extract config from a universal config.
local uConfig = require("uConfig")
local uBufferLine = uConfig.bufferLine

if uBufferLine == nil or not uBufferLine.enable then
  return
end

local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("bufferline not found!")
  return
end

-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    -- Use moll/vim-bbye :Bdelete command to close the tab.
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- Sidebar(nvim-tree) configuration.
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- Use LSP.
    diagnostics = "nvim_lsp",
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})

-- Keybindings.
keymap("n", uBufferLine.prev, ":BufferLineCyclePrev<CR>")
keymap("n", uBufferLine.next, ":BufferLineCycleNext<CR>")
keymap("n", uBufferLine.close, ":Bdelete!<CR>")
keymap("n", uBufferLine.close_left, ":BufferLineCloseLeft<CR>")
keymap("n", uBufferLine.close_right, ":BufferLineCloseRight<CR>")
keymap("n", uBufferLine.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
keymap("n", uBufferLine.close_pick, ":BufferLinePickClose<CR>")
