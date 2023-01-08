local uConfig = require("uConfig")
local uTree = uConfig.nvimTree

if uTree == nil or not uTree.enable then
  return
end

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("nvim-tree not found!")
  return
end

-- Keybindings.
keymap("n", uTree.toggle, ":NvimTreeToggle<CR>")

local list_keys = {
  {
    key = uTree.edit,
    action = "edit",
  },
  {
    key = uTree.vsplit,
    action = "vsplit",
  },
  {
    key = uTree.split,
    action = "split",
  },
  {
    key = uTree.toggle_git_ignored,
    action = "toggle_git_ignored",
  },
  {
    key = uTree.toggle_dotfiles,
    action = "toggle_dotfiles",
  },
  {
    key = uTree.toggle_custom,
    action = "toggle_custom",
  },
  {
    key = uTree.refresh,
    action = "refresh",
  },
  {
    key = uTree.create,
    action = "create",
  },
  {
    key = uTree.remove,
    action = "remove",
  },
  {
    key = uTree.rename,
    action = "rename",
  },
  {
    key = uTree.copy,
    action = "copy",
  },
  {
    key = uTree.cut,
    action = "cut",
  },
  {
    key = uTree.paste,
    action = "paste",
  },
  {
    key = uTree.copy_name,
    action = "copy_name",
  },
  {
    key = uTree.copy_path,
    action = "copy_path",
  },
  {
    key = uTree.copy_absolute_path,
    action = "copy_absolute_path",
  },
  {
    key = uTree.toggle_file_info,
    action = "toggle_file_info",
  },
  {
    key = uTree.tabnew,
    action = "tabnew",
  },
  {
    key = uTree.cd,
    action = "cd",
  },
  {
    key = uTree.dir_up,
    action = "dir_up",
  },
}

nvim_tree.setup({
    open_on_setup = true,
    disable_netrw = true,
    git = {
        enable = true,
        ignore = true,
    },
    -- Support project plugin.
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    -- Hide dotfiles and customer dir.
    filters = {
        dotfiles = true,
        custom = { },
    },
    view = {
        width = 40,
        -- or right.
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = true,
            list = list_keys,
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
    system_open = {
        cmd = 'open',
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "after",
      },
    },
})
