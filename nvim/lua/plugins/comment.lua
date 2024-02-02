local uConfig = require("common.uConfig")
local uComment = uConfig.comment

if uComment == nil or not uComment.enable then
  vim.notify("Comment-nvim's config was not specified!")
  return {}
end

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

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
  end,
}
