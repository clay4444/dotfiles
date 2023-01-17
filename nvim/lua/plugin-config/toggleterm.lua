local uConfig = require("uConfig")
local uToggleTerm = uConfig.toggleterm

if uToggleTerm == nil or not uToggleTerm.enable then
  return
end

local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("toggleterm not found!")
  return
end

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  start_in_insert = true,
})

local Terminal = require("toggleterm.terminal").Terminal

-- Support lazygit.
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    -- Close.
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    -- Cancel the ESC key, leave it to lazygit.
    if vim.fn.mapcheck("<Esc>", "t") ~= "" then
      vim.api.nvim_del_keymap("t", "<Esc>")
    end
  end,
  on_close = function(_)
    -- Get the ESC key back.
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
      noremap = true,
      silent = true,
    })
  end,
})

local ta = Terminal:new({
  direction = "float",
  close_on_exit = true,
})

local tb = Terminal:new({
  direction = "vertical",
  close_on_exit = true,
})

local tc = Terminal:new({
  direction = "horizontal",
  close_on_exit = true,
})

local M = {}

M.toggleA = function(cmd)
  if ta:is_open() then
    ta:close()
    return
  end
  tb:close()
  tc:close()
  ta:open()
  if cmd ~= nil then
    ta:send(cmd)
  end
end

M.toggleB = function()
  if tb:is_open() then
    tb:close()
    return
  end
  ta:close()
  tc:close()
  tb:open()
end

M.toggleC = function()
  if tc:is_open() then
    tc:close()
    return
  end
  ta:close()
  tb:close()
  tc:open()
end

M.toggleG = function()
  lazygit:toggle()
end

vim.keymap.set({ "n", "t" }, uToggleTerm.toggle_window_A, M.toggleA)
vim.keymap.set({ "n", "t" }, uToggleTerm.toggle_window_B, M.toggleB)
vim.keymap.set({ "n", "t" }, uToggleTerm.toggle_window_C, M.toggleC)

vim.api.nvim_set_keymap("t", "<C-l>", "<Cmd> wincmd l<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-h>", "<Cmd> wincmd h<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-j>", "<Cmd> wincmd j<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-k>", "<Cmd> wincmd k<CR>", {noremap = true, silent = true})

vim.keymap.set({ "n", "t" }, "<leader>tg", M.toggleG)
