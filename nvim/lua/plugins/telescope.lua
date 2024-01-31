local uConfig = require("common.uConfig")
local uTelescope = uConfig.telescope

if uTelescope == nil or not uTelescope.enable then
  vim.notify("Telescope plugin is disabled.", "warn")
  return {}
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        -- Also can be normal.
        initial_mode = "insert",
        -- Shortcut keybindings.
        mappings = {
          i = {
            [uTelescope.move_selection_next] = "move_selection_next",
            [uTelescope.move_selection_previous] = "move_selection_previous",
            [uTelescope.cycle_history_next] = "cycle_history_next",
            [uTelescope.cycle_history_prev] = "cycle_history_prev",
            [uTelescope.close] = "close",
            [uTelescope.preview_scrolling_up] = "preview_scrolling_up",
            [uTelescope.preview_scrolling_down] = "preview_scrolling_down",
          },
        },
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

    -- keybindings.
    keymap("n", uTelescope.find_files, ":Telescope find_files<CR>")
    keymap("n", uTelescope.live_grep, ":Telescope live_grep<CR>")
  end,
}
