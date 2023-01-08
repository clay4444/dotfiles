local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not found!")
  return
end

telescope.setup({
  defaults = {
    -- Also can be normal.
    initial_mode = "insert",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- Change skin when searching file.
      -- dropdown cursor ivy
      -- theme = "dropdown", 
    }
  },
  extensions = {
     -- other extension plugin configuration.
  },
})
