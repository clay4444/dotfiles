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
