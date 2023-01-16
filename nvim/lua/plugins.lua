local packer = require("packer")
packer.startup({
  function(use)
    -- ============== Packer can control itself =======================
    use 'wbthomason/packer.nvim'

    -- ====================== Nvim-notify =============================
    use({
      "rcarriga/nvim-notify",
      config = function()
        require("plugin-config.nvim-notify")
      end,
    })

    -- ====================== Color Theme =============================
    use({
      "folke/tokyonight.nvim",
      config = function()
        require("plugin-config.tokyonight")
      end,
    })

    -- =========================== Nvim-tre ============================
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugin-config.nvim-tree")
      end,
    })

    -- ========================= Bufferline ============================
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
      config = function()
        require("plugin-config.bufferline")
      end,
    })

    -- =========================== Lualine ============================ 
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("plugin-config.lualine")
      end,
    })

    -- =========================== Telescope ==========================
    use({
      "nvim-telescope/telescope.nvim",
      -- opt = true,
      -- cmd = "Telescope",
      requires = {
        { "nvim-lua/plenary.nvim" },
        -- telescope extensions
        { "LinArcX/telescope-env.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
      },
      config = function()
        require("plugin-config.telescope")
      end,
    })

    -- ======================= Dashboard-nvim =========================
    use({
      "glepnir/dashboard-nvim",
      -- Revert to fix the error when starting.
      commit = "e517188dab55493fb9034b4d4f1a508ccacfcd45",
      config = function()
        require("plugin-config.dashboard")
      end,
    })

    -- ======================== Project ===============================
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("plugin-config.project")
      end,
    })

    -- ======================= Treesitter ============================= 
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        -- require("nvim-treesitter.install").update({ with_sync = true })
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
      config = function()
        require("plugin-config.nvim-treesitter")
      end,
    })

    -- ======================== Meason ================================
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    -- ======================== Lspconfig =============================
    use({ "neovim/nvim-lspconfig" })

    -- ======================== Nvim-cmp ==============================
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/vim-vsnip")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("rafamadriz/friendly-snippets")

    -- ===================== indent blankline =========================
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugin-config.indent-blankline")
      end,
    })

    -- =========================== Comment ============================
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("plugin-config.comment")
      end,
    })

    -- =========================== toggleterm ============================
    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("plugin-config.toggleterm")
      end,
    })
  end,
  config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
})
