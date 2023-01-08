-- Extract config from a universal config.
local uConfig = require("uConfig")
local keys = uConfig.keys

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- Set the leader key.
vim.g.mapleader = keys.leader_key
vim.g.maplocalleader = keys.leader_key

local opts_remap = {
  remap = true,
  silent = true,
}

local opts_expr = {
  expr = true,
  silent = true,
}

-- ============================Split windows start=================================

if keys.s_windows ~= nil and keys.s_windows.enable then
  local skey = keys.s_windows
  -- Cancel the default action os `s`.
  keymap("n", "s", "")
  -- Split windows.
  keymap("n", skey.split_vertically, ":vsp<CR>")
  keymap("n", skey.split_horizontally, ":sp<CR>")
  -- Close current window.
  keymap("n", skey.close, "<C-w>c")
  -- Close other windows.
  keymap("n", skey.close_others, "<C-w>o") -- close others
  -- Control + hjkl to achieve jump between multiple windows.
  keymap("n", skey.jump_left, "<C-w>h")
  keymap("n", skey.jump_down, "<C-w>j")
  keymap("n", skey.jump_up, "<C-w>k")
  keymap("n", skey.jump_right, "<C-w>l")
  -- Proportional control.
  keymap("n", skey.width_decrease, ":vertical resize -10<CR>")
  keymap("n", skey.width_increase, ":vertical resize +10<CR>")
  keymap("n", skey.height_decrease, ":vertical resize -10<CR>")
  keymap("n", skey.height_increase, ":vertical resize +10<CR>")
  -- Equal Proportio.
  keymap("n", skey.size_equal, "<C-w>=")
end

-- ============================Split windows end=================================


-- ============================Terminal option start==============================

keymap("n", "<leader>t", ":sp | terminal<CR>")
keymap("n", "<leader>vt", ":vsp | terminal<CR>")
keymap("t", "<Esc>", "<C-\\><C-n>")
keymap("t", "<C-h>", [[ <C-\><C-N><C-w>h ]])
keymap("t", "<C-j>", [[ <C-\><C-N><C-w>j ]])
keymap("t", "<C-k>", [[ <C-\><C-N><C-w>k ]])
keymap("t", "<C-l>", [[ <C-\><C-N><C-w>l ]])

-- ============================Terminal option end================================


-- ============================Command mode start=================================
-- Pre and next.
keymap("c", keys.c_next_item, "<C-n>", opts_remap)
keymap("c", keys.c_prev_item, "<C-p>", opts_remap)

-- ============================Command mode end=================================


-- ============================Visual mode start=================================
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("v", "J", ":move '>+1<CR>gv-gv")
keymap("v", "K", ":move '<-2<CR>gv-gv")
-- Do not copy when paste.
keymap("v", "p", '"_dP')

-- ============================Visual mode end=================================


-- ============================Insert mode start=================================

keymap("i", "<C-i>", "<ESC>I")
keymap("i", "<C-a>", "<ESC>A")

-- ============================Insert mode end=================================


-- ============================Other start=================================

-- map("n", "<C-j>", "4j", opt)
-- map("n", "<C-k>", "4k", opt)
keymap({ "n", "v" }, keys.n_v_10j, "10j")
keymap({ "n", "v" }, keys.n_v_10k, "10k")

-- save && quit
keymap("n", keys.n_save, ":w<CR>")
keymap("n", keys.n_save_quit, ":wq<CR>")
keymap("n", keys.n_save_all, ":wa<CR>")
keymap("n", keys.n_force_quit, ":qa!<CR>")

-- ============================Other end=================================


-- ============================Plugin start=================================

local pluginKeys = {}

-- nvim-tree.
-- Open and close.
map("n", "<C-m>", ":NvimTreeToggle<CR>", opt)

pluginKeys.nvimTreeList = {
  -- Open and close dir.
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- Open file with splited window.
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- Display hidden file(include customer hidden file and dotfiles).
  { key = "i", action = "toggle_custom" },
  { key = ".", action = "toggle_dotfiles" },
  -- File operation.
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- Telescope.
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
  i = {
    -- Up && Down.
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- History.
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- Close.
    ["<C-c>"] = "close",
    -- Preview the file.
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- Lsp.
pluginKeys.mapLSP = function(mapbuf)
  -- Rename.
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- Go xx.
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- Diagnostic.
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp.
pluginKeys.cmp = function(cmp)
    return {
        -- Display completion.
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- Cancel.
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- Last.
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- Next.
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- confirm.
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- Scroll if there were many items. 
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

return pluginKeys

-- ============================Plugin end=================================
