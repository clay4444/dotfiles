local uConfig = require("uConfig")
local uComment = uConfig.comment

if uComment == nil or not uComment.enable then
  vim.notify("Comment-nvim's config was not specified!")
  return
end

local status, comment = pcall(require, "Comment")
if not status then
  vim.notify("Comment-nvim plugin wasn't installed!")
  return
end

local opts = {
  mappings = {
    extra = false,
  },

  -- Normal mode.
  toggler = {
    line = uComment.toggler.line,
    block = uComment.toggler.block,
  },
  -- Visual mode.
  opleader = {
    line = uComment.opleader.line,
    bock = uComment.opleader.block,
  },
}

comment.setup(opts)
