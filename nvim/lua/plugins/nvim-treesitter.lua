return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
      -- Install language parser.
      -- :TSInstallInfo to checkout supported language.
      ensure_installed = { "json", "vim", "lua", "cpp" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Enable incremental selection.
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },

      -- Enable code indent(default keybinding is '=').
      indent = {
        enable = true,
      },
    })

    -- Enable folding support.
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- Do not fold in default.
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99
    end,
  },
}
