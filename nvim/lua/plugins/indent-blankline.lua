return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ident_blankline = require("ibl")

    ident_blankline.setup()

  end,
}
