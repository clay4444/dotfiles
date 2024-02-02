return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-cmdline",
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  config = function()
    local uConfig = require("common.uConfig")
    local cmp_conf = uConfig.cmp

    local cmp = require("cmp")

    -- Keybindings.
    local mapping = {
      [cmp_conf.complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      [cmp_conf.abort] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      [cmp_conf.confirm] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
      }),
      [cmp_conf.scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      [cmp_conf.scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      [cmp_conf.select_prev_item] = cmp.mapping.select_prev_item(),
      [cmp_conf.select_next_item] = cmp.mapping.select_next_item(),
    }

    cmp.setup({
      -- Specify snippet Engine.
      snippet = {
        expand = function(args)
          -- For `vsnip` users.
          vim.fn["vsnip#anonymous"](args.body)

          -- For `luasnip` users.
          -- require('luasnip').lsp_expand(args.body)

          -- For `ultisnips` users.
          -- vim.fn["UltiSnips#Anon"](args.body)

          -- For `snippy` users.
          -- require'snippy'.expand_snippet(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      -- Completion source.
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },

        -- For luasnip users.
        -- { name = 'luasnip' },

        --For ultisnips users.
        -- { name = 'ultisnips' },

        -- -- For snippy users.
        -- { name = 'snippy' },
      }, { { name = "buffer" }, { name = "path" } }),

      -- Keybinding.
      mapping = mapping,
    })

    -- Use buffer source in search mode.
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use path and cmdline source in command mode.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

  end,
}
