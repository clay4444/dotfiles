local uConfig = require("common.uConfig")
local uTree = uConfig.nvimTree

if uTree == nil or not uTree.enable then
  vim.notify("nvim-tree plugin was disabled.", "warn")
  return {}
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Custom Mappings
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      keymap("n", uTree.edit,                   api.node.open.edit,                    opts('Up'))
      keymap("n", uTree.vsplit,                 api.node.open.vertical,                opts('Up'))
      keymap("n", uTree.split,                  api.node.open.horizontal,              opts('Up'))
      keymap("n", uTree.toggle_git_ignored,     api.tree.toggle_gitignore_filter,      opts('Up'))
      keymap("n", uTree.toggle_dotfiles,        api.tree.toggle_hidden_filter,         opts('Up'))
      keymap("n", uTree.toggle_custom,          api.tree.toggle_custom_filter,         opts('Up'))
      keymap("n", uTree.refresh,                api.tree.reload,                       opts('Up'))
      keymap("n", uTree.create,                 api.fs.create,                         opts('Up'))
      keymap("n", uTree.remove,                 api.fs.remove,                         opts('Up'))
      keymap("n", uTree.rename,                 api.fs.rename,                         opts('Up'))
      keymap("n", uTree.copy,                   api.fs.copy.node,                      opts('Up'))
      keymap("n", uTree.cut,                    api.fs.cut,                            opts('Up'))
      keymap("n", uTree.paste,                  api.fs.paste,                          opts('Up'))
      keymap("n", uTree.copy_name,              api.fs.copy.filename,                  opts('Up'))
      keymap("n", uTree.copy_path,              api.fs.copy.relative_path,             opts('Up'))
      keymap("n", uTree.copy_absolute_path,     api.fs.copy.absolute_path,             opts('Up'))
      keymap("n", uTree.toggle_file_info,       api.node.show_info_popup,              opts('Up'))
      keymap("n", uTree.tabnew,                 api.node.open.tab,                     opts('Up'))
      keymap("n", uTree.cd,                     api.tree.change_root_to_node,          opts('Up'))
      keymap("n", uTree.dir_up,                 api.node.navigate.parent,              opts('Up'))
    end

    nvimtree.setup({
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
      on_attach = my_on_attach,
    })

    -- set keymaps
    keymap("n", uTree.toggle, "<cmd>NvimTreeToggle<CR>")
  end,
}
