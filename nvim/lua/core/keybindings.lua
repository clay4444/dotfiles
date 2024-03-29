-- Extract config from a universal config.
local uConfig = require("common.uConfig")
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

keymap("t", keys.terminal_to_normal, "<C-\\><C-n>")
-- Use toggleterm instead.
-- keymap("n", "<leader>t", ":sp | terminal<CR>")
-- keymap("n", "<leader>vt", ":vsp | terminal<CR>")
-- keymap("t", "<Esc>", "<C-\\><C-n>")
-- keymap("t", "<C-h>", [[ <C-\><C-N><C-w>h ]])
-- keymap("t", "<C-j>", [[ <C-\><C-N><C-w>j ]])
-- keymap("t", "<C-k>", [[ <C-\><C-N><C-w>k ]])
-- keymap("t", "<C-l>", [[ <C-\><C-N><C-w>l ]])

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
