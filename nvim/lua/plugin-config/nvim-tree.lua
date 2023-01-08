local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("nvim-tree not found!")
  return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    git = {
        enable = false,
    },
    -- Support project plugin.
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
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
            custom_only = false,
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
})

-- Auto close.
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
